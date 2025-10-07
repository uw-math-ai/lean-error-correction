theorem lean_workbook_plus_8232 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : x^2*y^3 + x^2*z^3 + y^2*x^3 + y^2*z^3 + z^2*x^3 + z^2*y^3 ≤ x*y^4 + x*z^4 + y*x^4 + y*z^4 + z*x^4 + z*y^4   := by
  simp [add_assoc, add_comm, add_left_comm]
  ring_nf
  simp [mul_add, add_mul, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (x^2 - x * y), sq_nonneg (x^2 - x * z), sq_nonneg (y^2 - y * x),
  sq_nonneg (y^2 - y * z), sq_nonneg (z^2 - z * x), sq_nonneg (z^2 - z * y)]