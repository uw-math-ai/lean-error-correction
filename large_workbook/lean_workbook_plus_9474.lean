theorem lean_workbook_plus_9474 (A B C : ℂ) (h : A + B + C = 0) : A^3 + B^3 + C^3 = 3 * A * B * C   := by
  rw [eq_neg_of_add_eq_zero_right h]
  ring