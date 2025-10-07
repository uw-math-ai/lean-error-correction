theorem lean_workbook_plus_1299 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) : (1 / (x * (x + 3 * y)) + 1 / (y * (y + 3 * x)) = 1 → x * y ≤ 1 / 2)   := by
  intro h
  field_simp [hx, hy] at h ⊢
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + y)]