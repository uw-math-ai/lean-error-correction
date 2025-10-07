theorem lean_workbook_plus_9719 (x y : ℝ) (hx: 0 ≤ x ∧ x ≤ 2) (hy: 0 ≤ y ∧ y ≤ √(2 * x - x^2)) : 0 ≤ √(x^2 + y^2)   := by
  exact Real.sqrt_nonneg (x^2 + y^2)