theorem lean_workbook_plus_5936 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) : 1 ≤ 1 / (x ^ 2 + y ^ 2) + x ^ 2 / (1 + x ^ 2) + y ^ 2 / (1 + y ^ 2)   := by
  field_simp [hx, hy]
  refine' (le_div_iff (by positivity)).mpr _
  nlinarith [sq_nonneg (x * y), sq_nonneg (x * y * (x - y))]