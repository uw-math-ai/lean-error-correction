theorem lean_workbook_plus_7118 (x : ℝ) (hx : 0 < x) : 2 * x * Real.sqrt x - 3 * x + 1 ≥ 0   := by
  have h1 : 0 ≤ x := le_of_lt hx
  have h2 : 0 ≤ √x := Real.sqrt_nonneg x
  have h3 : 0 ≤ (x - 1) ^ 2 := sq_nonneg (x - 1)
  nlinarith [Real.sq_sqrt h1]