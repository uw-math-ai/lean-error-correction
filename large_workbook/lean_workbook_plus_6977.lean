theorem lean_workbook_plus_6977 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (b + c) / (a ^ 2 + b * c) + (a + c) / (b ^ 2 + a * c) + (a + b) / (c ^ 2 + a * b) ≤ 1 / a + 1 / b + 1 / c   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  have h1 := sq_nonneg (a * b - a * c)
  have h2 := sq_nonneg (b * c - a * b)
  have h3 := sq_nonneg (c * a - b * c)
  nlinarith [sq_nonneg (a * b + c * a), sq_nonneg (a * b + b * c), sq_nonneg (b * c + c * a)]