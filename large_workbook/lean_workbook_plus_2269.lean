theorem lean_workbook_plus_2269 (u v : ℝ) (hu : u > 0) (hv : v > 0) : (u + v) ^ 2 ≥ 4 * u * v   := by
  nlinarith [sq_nonneg (u - v)]