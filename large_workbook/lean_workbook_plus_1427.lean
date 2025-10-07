theorem lean_workbook_plus_1427 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (h : 2 * (x + y) ≥ x * y + 1) : x ^ 2 + y ^ 2 ≥ 1 / 7 * (x ^ 2 * y ^ 2 + 1)   := by
  have h1 : 0 < x * y := mul_pos hx hy
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]