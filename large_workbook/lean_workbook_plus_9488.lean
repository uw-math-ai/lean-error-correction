theorem lean_workbook_plus_9488 (p : ℝ) (hp_pos : 0 < p) (hp_lt_on_3 : p < 1/3) : -(p^2 / 6) + p^3 / 2 < 0   := by
  nlinarith [pow_pos hp_pos 2, pow_pos hp_pos 3, hp_lt_on_3]