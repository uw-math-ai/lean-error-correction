theorem lean_workbook_plus_2123 (x : ℝ) (hx : 0 < x ∧ x < 1) : x^3 < 1 ∧ 1 < x^4 + 1   := by
  constructor <;> nlinarith [pow_pos hx.1 2, pow_pos hx.1 3, pow_pos hx.1 4]