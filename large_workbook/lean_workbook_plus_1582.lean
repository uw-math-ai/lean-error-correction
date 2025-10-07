theorem lean_workbook_plus_1582 (x : ℝ) (hx : 0 ≤ x ∧ x ≤ 1) : 1 + x^2 ≤ (1 + x)^2   := by
  nlinarith [sq_nonneg (x - 1), hx.1, hx.2]