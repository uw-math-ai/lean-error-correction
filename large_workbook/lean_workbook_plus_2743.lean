theorem lean_workbook_plus_2743 (a b c : ℝ) : 3 * (a ^ 4 * (b ^ 2 + c ^ 2) + b ^ 4 * (c ^ 2 + a ^ 2) + c ^ 4 * (a ^ 2 + b ^ 2)) + 6 * a ^ 2 * b ^ 2 * c ^ 2 ≥ 4 * a * b * c * (a ^ 2 * (b + c) + b ^ 2 * (c + a) + c ^ 2 * (a + b))   := by
  simp only [mul_add, add_mul]
  nlinarith [sq_nonneg (a^2 * b - a * b * c), sq_nonneg (a^2 * c - a * b * c),
  sq_nonneg (b^2 * c - a * b * c), sq_nonneg (b^2 * a - a * b * c), sq_nonneg (c^2 * a - a * b * c),
  sq_nonneg (c^2 * b - a * b * c)]