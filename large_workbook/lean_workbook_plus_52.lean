theorem lean_workbook_plus_52 : ∀ x : ℝ, Real.cos (2 * x) ^ 2 = (1 + Real.cos (4 * x)) / 2   := by
  simp [cos_sq, sin_sq, sub_eq_add_neg, add_assoc]
  exact fun x ↦ by ring