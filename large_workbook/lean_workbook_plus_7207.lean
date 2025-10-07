theorem lean_workbook_plus_7207 (x y : ℝ) (hx : x ≠ 0) (hy : y ≠ 0) : (4 * x ^ 2 * y ^ 2) / (x ^ 2 + y ^ 2) ^ 2 + x ^ 2 / y ^ 2 + y ^ 2 / x ^ 2 >= 3   := by
  field_simp [hx, hy]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (x * y), sq_nonneg (x^2 - y^2)]