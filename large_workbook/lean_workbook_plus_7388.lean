theorem lean_workbook_plus_7388 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) : 1 + 8 / (a + b) * (1 + 1 / c) ≥ 9 / (a + b + c)   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a + b), sq_nonneg (b - a), sq_nonneg (c - 1)]