theorem lean_workbook_plus_5508 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b = 1) : 1 / a + 1 / b + 4 / (a + b) ≥ 4   := by
  field_simp [ha.ne', hb.ne', hab]
  exact (le_div_iff' (by positivity)).mpr (by nlinarith [sq_nonneg (a - b), hab])