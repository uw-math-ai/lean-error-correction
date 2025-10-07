theorem lean_workbook_plus_7067 : ∀ x : ℝ, (sin x)^2 + (cos x)^2 ≥ 1 / 2 * (sin x + cos x)^2   := by
  exact fun x ↦ by nlinarith [sq_nonneg (sin x - cos x)]