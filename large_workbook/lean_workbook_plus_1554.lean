theorem lean_workbook_plus_1554  (a b : ℝ)
  (h₀ : 0 < a ∧ 0 < b)
  (h₁ : a * b * (a + Real.sqrt (1 + a^2)) ≤ 1)
  (h₂ : a^2 + b^2 = 1) :
  Real.sqrt (1 + a^2) ≤ (1 - a^2 * b) / (a * b)   := by
  rw [← sub_nonneg]
  field_simp [h₀.1.ne', h₀.2.ne']
  apply div_nonneg <;> nlinarith [sq_nonneg a, sq_nonneg b]