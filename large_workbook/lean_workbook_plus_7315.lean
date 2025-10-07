theorem lean_workbook_plus_7315 (a b : ℕ) (h₁ : 0 < a) (h₂ : 0 < b) : ∃ a b, a^2 - b^2 = a*b - 1   := by
  refine' ⟨1, 1, by norm_num⟩