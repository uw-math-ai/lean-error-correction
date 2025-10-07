theorem lean_workbook_plus_9601 (a b c : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) (hc : c ≥ 0) : a^(7/8) + b^(7/8) + c^(7/8) ≥ 3   := by
  norm_num [ha, hb, hc]