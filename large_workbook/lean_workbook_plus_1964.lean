theorem lean_workbook_plus_1964 (x y z a b c t : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hab : a ≥ x) (hbc : b ≥ y) (hca : c ≥ z) (h : t ≥ 0) : (a + t) / (x + t) + (b + t) / (y + t) + (c + t) / (z + t) ≤ a / x + b / y + c / z   := by
  refine' add_le_add_three _ _ _
  all_goals
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith