theorem lean_workbook_plus_7029 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) : (x ^ 3 + y ^ 3) * (x + y) ≥ (x ^ 2 + y ^ 2) ^ 2   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + y), mul_nonneg hx.le hy.le]