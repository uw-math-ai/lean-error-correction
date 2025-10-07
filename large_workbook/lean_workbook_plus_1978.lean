theorem lean_workbook_plus_1978 (a b c : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) (hc : c ≥ 0) : a ^ 4 + a ^ 4 + b ^ 4 + c ^ 4 ≥ 4 * a ^ 2 * b * c   := by
  have h1 := sq_nonneg (a^2 - b*c)
  nlinarith [sq_nonneg (a^2 - b*c), sq_nonneg (b^2 - c^2), sq_nonneg (c^2 - a^2)]