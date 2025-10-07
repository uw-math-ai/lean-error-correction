theorem lean_workbook_plus_8402 (x : ℝ) : (-1 ≤ cos x ^ 6 - sin x ^ 4 ∧ cos x ^ 6 - sin x ^ 4 ≤ 1)   := by
  have := sq_nonneg (cos x ^ 2 - sin x ^ 2)
  have := sq_nonneg (cos x ^ 2 + sin x ^ 2)
  constructor <;> nlinarith [cos_sq_add_sin_sq x]