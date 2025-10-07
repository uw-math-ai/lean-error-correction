theorem lean_workbook_plus_6676 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a * b / (a + b) + b * c / (b + c) + c * a / (c + a)) ≤ (a + b + c) / 2   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  have := sq_nonneg (a * b - b * c)
  have := sq_nonneg (a * c - b * c)
  have := sq_nonneg (a * b - b * c - (a * c - b * c))
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (b^2 - c^2), sq_nonneg (c^2 - a^2)]