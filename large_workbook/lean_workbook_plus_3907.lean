theorem lean_workbook_plus_3907 : 2 * 1^2 + 1 ≤ 3^1   := by
  norm_num [show (2 : ℝ) * 1 ^ 2 + 1 = 3 by norm_num]