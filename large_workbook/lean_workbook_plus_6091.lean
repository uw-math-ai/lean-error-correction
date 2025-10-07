theorem lean_workbook_plus_6091 (a b c : ℝ) (hab : a + b + c = 1) : a + b = 1 - c   := by
  linarith [hab]