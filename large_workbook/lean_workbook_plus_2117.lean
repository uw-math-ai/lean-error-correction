theorem lean_workbook_plus_2117  (z : ℂ) :
  2 * Complex.abs z^4 ≤ 2 * Complex.abs z^2 → Complex.abs z^2 ≤ 1   := by
  exact fun h ↦ by linarith [sq_nonneg (Complex.abs z ^ 2 - 1)]