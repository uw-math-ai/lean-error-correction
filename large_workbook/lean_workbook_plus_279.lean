theorem lean_workbook_plus_279 (a b c d : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hd : 0 ≤ d) : (a + b + c + d) ^ 3 ≥ 4 * (a * (c + d) ^ 2 + b * (d + a) ^ 2 + c * (a + b) ^ 2 + d * (b + c) ^ 2)   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  nlinarith [sq_nonneg (a + b + c + d), sq_nonneg (a + b - c - d), sq_nonneg (b + c - a - d)]