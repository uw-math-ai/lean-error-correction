theorem lean_workbook_plus_3908 (x : ℝ) (hx : 1 ≤ x ∧ x ≤ 2) : x^2 ≤ 3*x - 2   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (x - 2)]