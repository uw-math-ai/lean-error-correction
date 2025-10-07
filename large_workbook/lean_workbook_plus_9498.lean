theorem lean_workbook_plus_9498 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b = 49) : (1 / (1 + a))^(1 / 3) + (1 / (1 + 4 * b))^(1 / 3) ≥ 2 / (15^(1 / 3))   := by
  norm_num [ha, hb, hab]