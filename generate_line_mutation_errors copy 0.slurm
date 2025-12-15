#!/bin/bash

#SBATCH --job-name=generate_line_mutation_errors

#SBATCH --account=stf
#SBATCH --partition=cpu-g2
#SBATCH --nodes=1
#SBATCH --mem=3G
#SBATCH --time=5:00:00 # Max runtime in DD-HH:MM:SS format.

#SBATCH --chdir=/mmfs1/home/sgvtc
#SBATCH --output=/mmfs1/home/sgvtc/sbatch_stdout.txt # where STDOUT goes
#SBATCH --error=/mmfs1/home/sgvtc/sbatch_stderr.txt # where STDERR goes

# Modules to use (optional).
###############################################bin/leanenv-setup-new-new
#!/usr/bin/env bash
set -euo pipefail

# ========= Config =========
GS_USER="${GS_USER:-aurasoph}"
LEAN_TOOLCHAIN="${LEAN_TOOLCHAIN:-leanprover/lean4:v4.22.0-rc4}"
GS_BASE="/mmfs1/gscratch/scrubbed/${GS_USER}"
PROJ="${PROJ:-$HOME}"

# Point this to your NEW container
IMG="${IMG:-$GS_BASE/container/containers/lean-shell.sif}"

# Setup fast scratch directories
if [ -d /scr ]; then SCR="/scr/$USER/lean-env"; else SCR="/tmp/lean-env-$USER"; fi
mkdir -p "$SCR"/{li_cache,xdg_cache,pylibs,bin}



# --- Internal Script ---
SETUP_SCRIPT='
  set -u


  export PYTHONUSERBASE="$SCR/pylibs"
  export PATH="$PYTHONUSERBASE/bin:$PATH"
  mkdir -p "$PYTHONUSERBASE/lib/python3.12/site-packages"

  export PYTHONPATH="$PYTHONUSERBASE/lib/python3.12/site-packages:${PYTHONPATH:-}:/usr/local/lib/python3.12/site-packages"
  export PIP_CONFIG_FILE=/dev/null
  export PIP_USER=yes

  # Check if the container has the toolchain baked in at /opt/elan
  if [ -d "/opt/elan/toolchains" ]; then
      # USE CONTAINER VERSION (FAST)
      export ELAN_HOME="/opt/elan"
      export PATH="/opt/elan/bin:$PATH"
      echo "[leanenv] Using pre-installed toolchain from /opt/elan"
  else
      # FALLBACK TO SCRATCH
      export ELAN_HOME="$SCR/elan"
      export PATH="$SCR/elan/bin:$PATH"
      
      if ! command -v elan >/dev/null 2>&1; then
          echo "[leanenv] Elan not found. Installing to scratch..."
          curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh \
            | bash -s -- -y --no-modify-path --default-toolchain none
      fi
      
      # Only install if missing
      if ! elan toolchain list | grep -q "$LEAN_TOOLCHAIN"; then
          elan toolchain install "$LEAN_TOOLCHAIN"
          elan default "$LEAN_TOOLCHAIN"
      fi
  fi

  # Install tomli if missing (It will now safely install to $PYTHONUSERBASE)
  if ! python3 -c "import tomli" >/dev/null 2>&1; then
      # PIP_USER=yes handles the location automatically now
      pip install tomli >/dev/null
  fi


  # Check if Mathlib is already in the cache.
  OLEAN_CHECK=$(find "$SCR/li_cache" -name "Mathlib.olean" 2>/dev/null | head -n 1)
  
  if [ -z "$OLEAN_CHECK" ]; then
      echo "[leanenv] Verifying/Building Mathlib..."
      python3 -c "from lean_interact import TempRequireProject; TempRequireProject(require=\"mathlib\", lean_version=\"$LEAN_TOOLCHAIN\".split(\":\")[-1])"
  fi

  # Find all compiled library paths automatically
  NEW_PATHS=$(find "$SCR/li_cache" -type d -path "*/lib/lean" | sort -u | paste -sd:)
  if [ -n "$NEW_PATHS" ]; then
      export LEAN_PATH="${NEW_PATHS}${LEAN_PATH:+:$LEAN_PATH}"
  fi

  export LEAN_NUM_THREADS=$(nproc)



  INIT_FILE="$SCR/.container_init_$$"
  cat <<EOF > "$INIT_FILE"
# 1. Source user profile if it exists (ignoring errors)
if [ -f ~/.bashrc ]; then . ~/.bashrc || true; fi

# 2. RE-ASSERT CONTAINER PATHS (Override anything bashrc added)
export ELAN_HOME="$ELAN_HOME"
export PYTHONUSERBASE="$PYTHONUSERBASE"
export PIP_USER=yes
# Prepend our paths again to ensure they are first
export PATH="$ELAN_HOME/bin:$PYTHONUSERBASE/bin:\$PATH"
export PYTHONPATH="$PYTHONPATH"
export LEAN_PATH="$LEAN_PATH"

# 3. Visual indicator
PS1="[lean-env] \u@\h:\w$ "
EOF



cd lean-error-correction
pip install -e .
pip install langfuse
pip install asyncio
pip install aiolimiter
python scripts/line_mutation/mutate_proofs.py data/dubious_proofs0.jsonl data/src_pass.jsonl data/line_mutation_input0.jsonl
'

# Run Apptainer
APPTAINER_CACHEDIR="${APPTAINER_CACHEDIR:-$SCR/apptainer_cache}" apptainer exec --cleanenv \
  --bind /mmfs1,"$HOME" \
  --bind "$SCR/li_cache":/opt/lean_interact_cache \
  --bind "$SCR/xdg_cache":/root/.cache \
  --env SCR="$SCR" \
  --env DEV_SRC="${DEV_SRC:-}" \
  --env LEAN_TOOLCHAIN="$LEAN_TOOLCHAIN" \
  --pwd "$PROJ" "$IMG" /bin/bash -c "$SETUP_SCRIPT"
########################################################################################################