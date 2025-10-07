theorem lean_workbook_plus_7666 : ∀ (x y z : ℝ), 3 * (x ^ 2 + y ^ 2 + z ^ 2) ≥ (x + y + z) ^ 2   := by
  exact fun x y z ↦ by nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]