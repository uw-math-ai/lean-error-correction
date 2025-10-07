theorem lean_workbook_plus_8773 (u v : ℝ) (hu : u ≥ 0) (hv : v ≥ 0) : u^3 - u * v^2 + v^3 ≥ 0   := by
  nlinarith [sq_nonneg (u - v), sq_nonneg (u + v)]