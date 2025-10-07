theorem lean_workbook_plus_3255 (x : ℝ) (hx : 0 < x ∧ x ≤ 1) :
  (1 + x^30) / (1 + x^60) < 1 + x^30   := by
  rw [div_lt_iff (by positivity)]
  nlinarith [pow_pos hx.1 30, pow_pos hx.1 60]