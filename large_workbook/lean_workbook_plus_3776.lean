theorem lean_workbook_plus_3776 (w z : ℂ) (hw : w + z = 1) (hz : w * z = -3) : w^2 - w - 3 = 0 ∧ z^2 - z - 3 = 0   := by
  have h1 : w = 1 - z := by linear_combination hw
  simp [h1, hz, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  refine ⟨?_,?_⟩
  all_goals linear_combination h1 * z - hz