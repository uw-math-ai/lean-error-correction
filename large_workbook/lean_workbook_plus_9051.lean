theorem lean_workbook_plus_9051 (a b c : ℝ) : (a^2 + a * b + b^2) * (b^2 + b * c + c^2) * (c^2 + c * a + a^2) ≥ 1 / 3 * (a * b + b * c + c * a)^2 * (a + b + c)^2   := by
  have h1 : 0 ≤ (a * b - b * c)^2 * (b * c - c * a)^2 * (c * a - a * b)^2 := by positivity
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]