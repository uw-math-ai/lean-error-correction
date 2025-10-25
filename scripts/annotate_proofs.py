# scripts/annotate_proofs.py

from lean_verifier.config import settings
from lean_verifier.annotation_generator import annotate_proofs

def load_processed_hashes(annotated_file: Path, excluded_file: Path) -> set[str]:
    """
    Reads both output files and returns a set of SHA1 hashes
    of the 'incorrect_proof' text for all processed records.
    """
    processed_hashes = set()
    def get_hash(text: str) -> str:
        return hashlib.sha1(text.encode('utf-8')).hexdigest()

    for file_path in [annotated_file, excluded_file]:
        if file_path.exists():
            with file_path.open('r', encoding='utf-8') as f:
                for line in f:
                    try:
                        data = json.loads(line)
                        if 'incorrect_proof' in data:
                            processed_hashes.add(get_hash(data['incorrect_proof']))
                    except (json.JSONDecodeError, KeyError):
                        continue
    return processed_hashes

def main():
    """Main function for Annotate Incorrect Proofs."""
    annotate_proofs(settings.incorrect_proofs_file, settings.annotated_proofs_file, settings.excluded_proofs_file)

if __name__ == "__main__":
    main()