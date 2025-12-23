from lean_verifier.config import settings
from lean_verifier.annotation_generator import annotate_proofs
import sys
from pathlib import Path

    

if __name__ == "__main__":
    nontrivial_args = sys.argv[1:]
    if len(nontrivial_args) != 0:
        dubious_proofs_file, annotated_lme_proofs_file, excluded_lme_proofs_file = nontrivial_args
        annotate_proofs(Path(dubious_proofs_file), Path(annotated_lme_proofs_file), Path(excluded_lme_proofs_file))
    else:
        annotate_proofs(settings.dubious_proofs_file, settings.annotated_lme_proofs_file, settings.excluded_lme_proofs_file)