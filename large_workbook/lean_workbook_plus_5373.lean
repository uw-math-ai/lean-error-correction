theorem lean_workbook_plus_5373 (a : ℝ) (ha : a ≠ 0) : a ^ 2 > 0   := by
  nlinarith [sq_pos_of_ne_zero a ha]