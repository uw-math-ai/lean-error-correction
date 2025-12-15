#!/bin/bash

#SBATCH --job-name=generate_line_mutation_errors

#SBATCH --account=amath
#SBATCH --partition=cpu-g2
#SBATCH --nodes=1
#SBATCH --mem=3G
#SBATCH --time=10:00:00 # Max runtime in DD-HH:MM:SS format.

#SBATCH --chdir=/mmfs1/home/sgvtc

# Modules to use (optional).
###############################################bin/leanenv-setup-new-new
#!/usr/bin/env bash
set -euo pipefail
echo "Started an apptainer run. Setting up apptainer..."

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
SETUP_SCRIPT=$(<$1)

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