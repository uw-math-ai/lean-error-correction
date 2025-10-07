theorem lean_workbook_plus_3372 (x : ℝ) (hx : 0 < x) : 1 + 2 * Real.log x ≤ x^2   := by
  nlinarith [add_sq (Real.log x) 1, log_le_sub_one_of_pos hx]