theorem lean_workbook_plus_9405 : ∃ u v : ℤ, u^2 - 5 * v^2 = 4   := by
  refine' ⟨3, 1, by norm_num⟩