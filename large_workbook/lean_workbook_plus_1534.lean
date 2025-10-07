theorem lean_workbook_plus_1534  (a b c : ℝ)
  (h₀ : 0 < a ∧ 0 < b ∧ 0 < c)
  (h₁ : a + b + c = 3)
  (h₂ : a * b + b * c + c * a = 3) :
  a * b * c ≥ 1   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]