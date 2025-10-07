theorem lean_workbook_plus_244 (a b c : ℝ) (habc : a * b * c = 1) : (1 / (a^2 + 79 * a + 1)^(1 / 4) + 1 / (b^2 + 79 * b + 1)^(1 / 4) + 1 / (c^2 + 79 * c + 1)^(1 / 4)) ≥ 1   := by
  norm_num [habc]