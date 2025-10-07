theorem lean_workbook_plus_6707  (a b : ℝ)
  (h₀ : 0 ≤ a ∧ 0 ≤ b)
  (h₁ : a ≤ b) :
  a / (1 + a) ≤ b / (1 + b)   := by
  rw [div_le_div_iff] <;> nlinarith