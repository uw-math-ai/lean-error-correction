theorem lean_workbook_plus_1312 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (hxy : x + y < 1) : (1 - x) / (1 + x) * (1 - y) / (1 + y) ≥ (1 - x - y) / (1 + x + y)   := by
  field_simp [hx, hy, hxy]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [mul_nonneg hx.le hy.le, hxy]