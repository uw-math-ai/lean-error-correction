theorem lean_workbook_plus_7664 (a b c : ℝ) : |a + b| + |b + c| + |c + a| ≤ |a| + |b| + |c| + |a + b + c|   := by
  simp [abs_eq_max_neg]
  simp [max_def, add_comm, add_left_comm, add_assoc]
  split_ifs <;> linarith