theorem lean_workbook_plus_1539 (a b c : ℝ) (ha : a > 0) (hb : b > 0) (hc : c > 0) : (5 * (a ^ 2 + b ^ 2 + c ^ 2) + 2 * (a * b + b * c + a * c)) / (2 * (a ^ 2 + b ^ 2 + c ^ 2) + (a + b + c) ^ 2) ≤ 9 / 2   := by
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]