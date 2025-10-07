theorem lean_workbook_plus_8922 (n : ℕ) (x : ℝ) (hx: x >= 1): n * (x ^ 2 - 1) ^ 2 * (2 * x ^ n + 1) + 2 * x ^ n * (x ^ 4 + 4 * x ^ 2 + 3) + 2 * (x ^ 4 - 1) ≥ 0   := by
  have h1 : 0 ≤ (x^2 - 1)^2 := sq_nonneg (x^2 - 1)
  have h2 : 0 ≤ x^4 - 1 := by nlinarith
  positivity