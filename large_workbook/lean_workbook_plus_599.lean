theorem lean_workbook_plus_599 (a b c : ℝ) : |a - b|^2 = |(a - c) - (b - c)|^2   := by
  simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm]