theorem lean_workbook_plus_8155 (f : ℤ → ℤ) (hf : ∃ a b, ∀ x, f x = a * x + b) : f 0 = 3 ∧ f 1 = 2023 → f (-10) = -20197   := by
  aesop
  linarith [h_1 10, h_1 (-10)]