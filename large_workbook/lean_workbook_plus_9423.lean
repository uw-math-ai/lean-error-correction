theorem lean_workbook_plus_9423  (a b : ℝ)
  (h₀ : a ≠ 0 ∧ b ≠ 0) :
  1 / a + 1 / b = (a + b) / (a * b)   := by
  field_simp [h₀.1, h₀.2, add_comm]