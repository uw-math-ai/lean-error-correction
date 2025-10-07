theorem lean_workbook_plus_5840 (x : ℝ) (hx : x < 1) : x + Real.log (1 - x) ≤ 0   := by
  nlinarith [log_le_sub_one_of_pos (sub_pos_of_lt hx)]