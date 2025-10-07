theorem lean_workbook_plus_3709 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : 3 * (a^2 + b^2 + c^2) * (a^2 * b^2 + b^2 * c^2 + c^2 * a^2) ≥ (a^2 + a * b + b^2) * (b^2 + b * c + c^2) * (a^2 + a * c + c^2)   := by
  have h1 : 0 ≤ (a - b)^2 * (b - c)^2 * (c - a)^2 := by positivity
  nlinarith [sq_nonneg (a * b - b * c), sq_nonneg (b * c - c * a), sq_nonneg (c * a - a * b)]