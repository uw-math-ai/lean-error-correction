theorem lean_workbook_plus_652 1 ∈ {x : ℝ | -x^2 + 2*x - 1 = 0}   := by
  norm_num [sq, sub_eq_add_neg, add_assoc]