theorem lean_workbook_plus_854 (x k z : ℝ) : ∃ x1 k1 z1 : ℝ, x1 = x / 3 ∧ k1 = k / 3 ∧ z1 = z / 3   := by
  refine' ⟨x / 3, k / 3, z / 3, by norm_num, by norm_num, by norm_num⟩