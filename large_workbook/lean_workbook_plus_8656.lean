theorem lean_workbook_plus_8656 (x : ℝ) (hx : 0 ≤ x) : exp x ≥ x + 1   := by
  nlinarith [add_one_le_exp x]