theorem lean_workbook_plus_9252 (a b : ℝ) : |a - b| ≤ |a| + |b|   := by
  simpa only [sub_eq_add_neg, abs_neg] using abs_add a (-b)