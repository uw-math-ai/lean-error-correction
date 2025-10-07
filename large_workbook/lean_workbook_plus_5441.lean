theorem lean_workbook_plus_5441 (f : ℕ → ℕ) (h : f 0 = f 0 ^ 2) : f 0 = 0 ∨ f 0 = 1   := by
  simp [pow_two] at h
  by_cases hf0 : f 0 = 0 <;> simp [hf0] at h <;> aesop