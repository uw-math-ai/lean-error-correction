theorem lean_workbook_plus_9599  (x y z : ℝ)
  (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
  x^4 + y^4 + z^4 ≥ x^3 * y + y^3 * z + z^3 * x   := by
  have h₁ : 0 ≤ (x - y)^2 + (y - z)^2 + (z - x)^2 := by nlinarith
  nlinarith [sq_nonneg (x^2 - y^2), sq_nonneg (y^2 - z^2), sq_nonneg (z^2 - x^2)]