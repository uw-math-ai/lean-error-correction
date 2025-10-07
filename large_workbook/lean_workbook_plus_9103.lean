theorem lean_workbook_plus_9103 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (hxy : 1 ≤ x * y) :
  1 / (1 + x^2) + 1 / (1 + y^2) ≥ 2 / (1 + x * y)   := by
  field_simp [hx, hy, hxy]
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]