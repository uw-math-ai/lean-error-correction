theorem lean_workbook_plus_8073  (x y z : ℝ)
  (h₀ : x < 0 ∧ y < 0 ∧ z < 0)
  (h₁ : x^4 + y^4 + z^4 = 3) :
  x^3 + y^3 + z^3 + (x^2 * y + y^2 * z + z^2 * x) ≤ 6   := by
  nlinarith [sq_nonneg (x + y + z), sq_nonneg (x + y), sq_nonneg (y + z), sq_nonneg (z + x)]