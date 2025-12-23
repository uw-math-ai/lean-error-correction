import sys
from pathlib import Path
import json

def fix_by(record):
    if "data" in record:
        record["data"]["incorrect_proof"] = "by".join(record["data"]["incorrect_proof"].split("by\n", 1))
    else:
        record["incorrect_proof"] = "by".join(record["incorrect_proof"].split("by\n", 1))
    return record

if __name__ == "__main__":
    nontrivial_args = sys.argv[1:]
    path = Path(nontrivial_args[0])
    with path.open('r') as f:
        lines = f.readlines()
    with path.open('w') as f:
        f.writelines([json.dumps(fix_by(json.loads(line))) + '\n' for line in lines])

    