theorem lean_workbook_plus_8193 (a b c : ℂ) (h : a + b + c = 0) : a ^ 3 + b ^ 3 + c ^ 3 = 3 * a * b * c   := by
  rw [eq_neg_of_add_eq_zero_right h]
  ring