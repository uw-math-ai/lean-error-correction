theorem lean_workbook_plus_6331 (s : ℝ) : s / 20 - s / 25 = s / 100   := by
  linarith [show (20 : ℝ) ≠ 0 by norm_num, show (25 : ℝ) ≠ 0 by norm_num]