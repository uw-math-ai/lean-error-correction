theorem lean_workbook_plus_690 (x y z : ℝ) (hx : x > 0) (hy : y > 0) (hz : z > 0) : x^3*y + y^3*z + z^3*x + x*y^3 + y*z^3 + z*x^3 >= 2 * (x^2*y^2 + y^2*z^2 + z^2*x^2)   := by
  have := sq_nonneg (x - y)
  have := sq_nonneg (y - z)
  have := sq_nonneg (z - x)
  nlinarith [mul_nonneg hx.le hy.le, mul_nonneg hy.le hz.le, mul_nonneg hz.le hx.le]