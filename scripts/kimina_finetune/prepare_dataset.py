"""
Dataset Preparation for Lean Code Error Correction
Loads JSONL files and formats them as chat messages (system, user, assistant)
"""

import json
from datasets import Dataset, DatasetDict
from typing import List, Dict
import os


class LeanErrorCorrectionDataset:
    """
    Prepare Lean error correction dataset in chat format
    """
    
    def __init__(
        self,
        jsonl_file: str,
        train_split: float = 0.95,
        seed: int = 42
    ):
        """
        Args:
            jsonl_file: Path to JSONL file
            train_split: Proportion of data for training (rest is validation)
            seed: Random seed for splitting
        """
        self.jsonl_file = jsonl_file
        self.train_split = train_split
        self.seed = seed
    
    def load_jsonl(self) -> List[Dict]:
        """Load data from JSONL file"""
        data = []
        with open(self.jsonl_file, 'r', encoding='utf-8') as f:
            for line in f:
                if line.strip():
                    data.append(json.loads(line))
        return data
    
    def format_as_chat_completion(self, entry: Dict) -> Dict:
        prompt_messages = [
            {"role": "system", "content": entry.get('system','')},
            {"role": "user", "content": entry.get('prompt','')},
        ]
        completion_messages = [
            {"role": "assistant", "content": entry.get('response','')}
        ]
        return {"prompt": prompt_messages, "completion": completion_messages}
    
    def create_dataset(self) -> DatasetDict:
        """
        Load JSONL, format as chat, and split into train/val
        """
        print(f"Loading data from {self.jsonl_file}...")
        raw_data = self.load_jsonl()
        print(f"✓ Loaded {len(raw_data)} examples")
        
        if len(raw_data) == 0:
            raise ValueError("No data found in the provided JSONL file.")
          
        if 'split' in raw_data[0]:
            print("Detected 'split' field in data; using it for train/validation split.")
            train_data = []
            val_data = []
            for i, entry in enumerate(raw_data):
                try:
                    assert 'split' in entry, f"Entry {i} missing 'split' field."
                    formatted_entry = self.format_as_chat_completion(entry)
                except Exception as e:
                    print(f"Warning: Skipping entry {i} due to error: {e}")
                    continue
                if entry['split'] == 'train':
                    train_data.append(formatted_entry)
                elif entry['split'] == 'validation':
                    val_data.append(formatted_entry)
                else:
                    continue
            
            dataset_dict = DatasetDict({
                'train': Dataset.from_list(train_data),
                'validation': Dataset.from_list(val_data)
            })
            
            print(f"✓ Split into train ({len(dataset_dict['train'])}) and validation ({len(dataset_dict['validation'])})")
            
        else:
            formatted_data = []
            for i, entry in enumerate(raw_data):
                try:
                    formatted = self.format_as_chat_completion(entry)
                    formatted_data.append(formatted)
                except Exception as e:
                    print(f"Warning: Skipping entry {i} due to error: {e}")
                    continue
        
            print(f"✓ Formatted {len(formatted_data)} examples")
            
            # Create HuggingFace Dataset
            dataset = Dataset.from_list(formatted_data)
            
            # Split into train and validation
            split_dataset = dataset.train_test_split(
                test_size=1 - self.train_split,
                seed=self.seed
            )
            
            dataset_dict = DatasetDict({
                'train': split_dataset['train'],
                'validation': split_dataset['test']
            })
            
            print(f"✓ Split into train ({len(dataset_dict['train'])}) and validation ({len(dataset_dict['validation'])})")
        
        return dataset_dict
    
    def save_dataset(self, dataset_dict: DatasetDict, output_dir: str):
        """Save processed dataset to disk"""
        os.makedirs(output_dir, exist_ok=True)
        dataset_dict.save_to_disk(output_dir)
        print(f"✓ Dataset saved to {output_dir}")
    
    def preview_examples(self, dataset_dict: DatasetDict, num_examples: int = 2):
        """Preview formatted examples"""
        print("\n" + "="*80)
        print("PREVIEW OF FORMATTED EXAMPLES")
        print("="*80 + "\n")
        
        for i in range(min(num_examples, len(dataset_dict['train']))):
            example = dataset_dict['train'][i]
            print(f"--- Example {i+1} ---\n")
            
            if 'messages' in example:
                for msg in example['messages']:
                    role = msg['role']
                    content = msg['content']
                    print(f"[{role.upper()}]:\n{content}\n")
            elif 'prompt' in example and 'completion' in example:
                print("[PROMPT]:\n")
                for msg in example['prompt']:
                    role = msg['role']
                    content = msg['content']
                    print(f"[{role.upper()}]:\n{content}\n")
                print("[COMPLETION]:\n")
                for msg in example['completion']:
                    role = msg['role']
                    content = msg['content']
                    print(f"[{role.upper()}]:\n{content}\n")
            else:
                print("Unknown example format.\n")
                for key, value in example.items():
                    print(f"{key}: {value}\n")
            
            print("-" * 80 + "\n")


class OurFormatLeanErrorCorrectionDataset(LeanErrorCorrectionDataset):
    """
    Custom format for Lean error correction dataset
    Overrides format_as_chat_completion to use a different prompt structure
    """
    
    def format_as_chat_completion(self, entry: Dict) -> Dict:
        """
        Convert a single entry to chat format
        
        Expected JSONL format:
        {
            "incorrect_proof": "...",
            "correct_proof": "...",
            "path": "...", (optional),
            "explanation": "..." (optional),
            "state_at_error": "..." (optional),
            "line_at_error": "..." (optional),
            "error": "..." (optional),
            "formalized_statement": "..." (optional),
            "error_pos": ... (optional),
            "split": "train" or "validation" (optional)
        }
        """
        system_prompt = (
            "You are a Lean 4 programmer diagnosing a single failing proof. "
            "Assume you only see the incorrect proof text, "
            "the infoview state near the failure, and Lean’s error message."
        )
        
        incorrect_proof = entry.get('incorrect_proof', None)
        correct_proof = entry.get('correct_proof', None)
        explanation = entry.get('explanation', None)
        fix = entry.get('fix_suggestion', None)
        file = entry.get('path', None)
        state_at_error = entry.get('state_at_error', None)
        line_at_error = entry.get('line_at_error', None)
        error = entry.get('error', None)
        formalized_statement = entry.get('formalized_statement', None)
        error_pos = entry.get('error_pos', None)
        
        if not incorrect_proof:
            raise ValueError(f"Could not find incorrect proof in entry: {entry.keys()}")
        if not correct_proof:
            raise ValueError(f"Could not find correct proof in entry: {entry.keys()}")
        
        user_message = (
            "**Instruction:** Explain why this proof fails, then explain how to fix it at a high level (no code). "
            "Finally, provide the full corrected Lean 4 theorem/proof in a single ```lean``` code block.\n\n"
            "**Context:**\n\n"
            f"File: `{file if file else '(empty)'}`\n\n"
            f"Incorrect proof:\n```lean\n{incorrect_proof}\n```\n\n"
            f"Infoview state:\n{state_at_error if state_at_error else '(empty)'}\n\n"
            f"Line at error:\n{line_at_error if line_at_error else '(empty)'}\n\n"
            f"Lean error:\n{error if error else '(empty)'}"
        )
            
        assistant_message = (
            f"Explanation:\n{explanation if explanation else '(no explanation provided)'}\n\n"
            f"Fix:\n{fix if fix else '(no fix suggestion provided)'}\n\n"
            f"Corrected Lean proof:\n```lean\n{correct_proof}\n```"
        )
        
        # Create chat format
        prompt_messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_message},
        ]
        
        completion_messages = [
            {"role": "assistant", "content": assistant_message}
        ]
        
        return {"prompt": prompt_messages, "completion": completion_messages}
        

def main():
    """
    Example usage
    """
    import argparse
    
    parser = argparse.ArgumentParser(description="Prepare Lean error correction dataset")
    parser.add_argument(
        "--jsonl_file",
        type=str,
        required=True,
        help="Path to input JSONL file"
    )
    parser.add_argument(
        "--output_dir",
        type=str,
        default="./lean_dataset",
        help="Directory to save processed dataset"
    )
    parser.add_argument(
        "--train_split",
        type=float,
        default=0.95,
        help="Proportion of data for training (default: 0.95)"
    )
    
    args = parser.parse_args()
    
    # Create dataset
    dataset_creator = OurFormatLeanErrorCorrectionDataset(
        jsonl_file=args.jsonl_file,
        train_split=args.train_split
    )
    
    # Load and format
    dataset_dict = dataset_creator.create_dataset()
    
    # Preview examples
    dataset_creator.preview_examples(dataset_dict)
    
    # Save
    dataset_creator.save_dataset(dataset_dict, args.output_dir)
    
    print("\n" + "="*80)
    print("NEXT STEPS")
    print("="*80)
    print(f"1. Review the formatted examples above")
    print(f"2. Dataset saved to: {args.output_dir}")
    print(f"3. Use this dataset in training with: --dataset_path {args.output_dir}")


if __name__ == "__main__":
    main()
