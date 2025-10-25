from lean_verifier.config import settings
from lean_verifier.annotation_generator import annotate_proofs


def main():
    annotate_proofs(settings.dubious_proofs_file, settings.annotated_lme_proofs_file, settings.excluded_lme_proofs_file)

if __name__ == "__main__":
    main()