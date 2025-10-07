theorem lean_workbook_plus_2409 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : a / (b + 2 * c) + b / (c + 2 * a) + c / (a + 2 * b) ≥ 1   := by
  field_simp [ha, hb, hc]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]