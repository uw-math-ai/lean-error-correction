theorem lean_workbook_plus_6179 (θ : ℝ) : sin (3 * θ) = 3 * sin θ - 4 * (sin θ)^3   := by
  simp [Real.sin_three_mul, sub_eq_add_neg]