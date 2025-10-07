theorem lean_workbook_plus_2545 (a b c : ℝ) (hab : 0 < a) (hbc : 0 < b) (hca : 0 < c) : (a / (b + c) + b / (c + a) + c / (a + b)) ≥ 3 / 2   := by
  field_simp [add_assoc, add_comm, add_left_comm]
  exact (div_le_div_iff (by positivity) (by positivity)).mpr (by nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)])