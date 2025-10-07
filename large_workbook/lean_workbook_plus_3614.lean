theorem lean_workbook_plus_3614  (a b : ℤ) :
  (6 * a + 2 * b) - 2 * b = 6 * a   := by
  simp [mul_add, mul_comm, mul_left_comm, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]