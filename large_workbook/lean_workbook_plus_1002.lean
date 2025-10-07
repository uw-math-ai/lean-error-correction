theorem lean_workbook_plus_1002 (a b c d : ℝ) (hb : 0 < b) (hd : 0 < d) (h : a / b < c / d) : a / b < (a + c) / (b + d) ∧ (a + c) / (b + d) < c / d   := by
  constructor <;> rw [div_lt_div_iff (by positivity) (by positivity)]
  all_goals rw [div_lt_div_iff] at h <;> nlinarith