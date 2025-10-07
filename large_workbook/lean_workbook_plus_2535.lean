theorem lean_workbook_plus_2535 : ∀ x : ℝ, Real.cos (2 * x) = 2 * (Real.cos x)^2 - 1   := by
  exact fun x ↦ Real.cos_two_mul x