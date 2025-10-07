theorem lean_workbook_plus_969 (x y z : ℝ) : (1 / x + 1 / y + 1 / z) ^ 2 ≥ 3 * (1 / (x * y) + 1 / (y * z) + 1 / (z * x))   := by
  ring_nf
  nlinarith [sq_nonneg (x⁻¹ - y⁻¹), sq_nonneg (x⁻¹ - z⁻¹), sq_nonneg (y⁻¹ - z⁻¹)]