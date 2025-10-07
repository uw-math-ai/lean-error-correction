theorem lean_workbook_plus_4331 (a b c : ℝ) (ha : a > 0) (hb : b > 0) (hc : c > 0) : (a / (b + c) + b / (a + c) + c / (a + b)) ≥ 3 / 2   := by
  field_simp [ha, hb, hc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]