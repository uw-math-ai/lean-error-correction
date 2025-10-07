theorem lean_workbook_plus_6819 (a b k : ℝ) (ha : 0 < a) (hb : 0 < b) (hk : 7 ≤ k) : (a / (a + k * b))^(1 / 3) + (b / (b + k * a))^(1 / 3) ≥ 2 / (k + 1)^(1 / 3)   := by
  norm_num [ha, hb, hk]