theorem lean_workbook_plus_6933 : ∀ c d : ℝ, c > 0 ∧ d > 0 → c^2 / d + d ≥ 2 * c   := by
  refine' fun c d h => le_of_sub_nonneg _
  field_simp [h.1.ne', h.2.ne']
  refine' div_nonneg (by nlinarith [sq_nonneg (c - d), h.1, h.2]) (by nlinarith)