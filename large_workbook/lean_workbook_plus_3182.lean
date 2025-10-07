theorem lean_workbook_plus_3182 (a b c : ℤ) (h₁ : a ≠ b) (h₂ : a ≠ c) (h₃ : b ≠ c) : ∃ a b, 30 ∣ a^3 * b - a * b^3   := by
  refine' ⟨0, 0, by norm_num⟩