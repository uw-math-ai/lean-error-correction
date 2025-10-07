theorem lean_workbook_plus_2677 (x : ℝ) (hx: x + 2*x > 6 - 3*x) : x > 1   := by
  linarith [show (0 : ℝ) ≤ 2 by norm_num, show (0 : ℝ) ≤ 3 by norm_num]