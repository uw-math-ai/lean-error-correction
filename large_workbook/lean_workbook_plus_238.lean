theorem lean_workbook_plus_238 (x_1 x_2 : ℝ) (hx_1 : 0 < x_1) (hx_2 : 0 < x_2) : x_1 + x_2 ≥ 2 * Real.sqrt (x_1 * x_2)   := by
  have : (Real.sqrt (x_1 * x_2))^2 = x_1 * x_2 := Real.sq_sqrt (mul_nonneg hx_1.le hx_2.le)
  nlinarith [sq_nonneg (x_1 - x_2)]