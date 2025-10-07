theorem lean_workbook_plus_3332 : ∀ x : ℝ, (x - 1) ^ 2 * ((x ^ 2 - 1) ^ 2 + x ^ 2) ≥ 0   := by
  exact fun x ↦ mul_nonneg (sq_nonneg (x - 1)) (add_nonneg (sq_nonneg (x ^ 2 - 1)) (sq_nonneg x))