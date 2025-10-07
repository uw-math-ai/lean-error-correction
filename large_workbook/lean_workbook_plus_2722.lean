theorem lean_workbook_plus_2722 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a / b)^(1 / 3) + (b / c)^(1 / 5) + (c / a)^(1 / 7) > 5 / 2   := by
  norm_num [ha, hb, hc]