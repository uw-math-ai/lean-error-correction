theorem lean_workbook_plus_2484 (a b c : ℤ) (h₁ : a + b + c = 96) (h₂ : a = 6 * c) (h₃ : c = b - 40) : |a - b| = 5   := by
  simp [h₁, h₂, h₃, abs_of_nonneg]
  rw [abs_of_neg] <;> linarith