theorem lean_workbook_plus_3826 : ∀ u v w : ℝ, (2 * u - v - w) ^ 2 / 4 + 3 * (v - w) ^ 2 / 4 ≥ 0   := by
  exact fun u v w ↦ by nlinarith [sq_nonneg (2 * u - v - w), sq_nonneg (v - w)]