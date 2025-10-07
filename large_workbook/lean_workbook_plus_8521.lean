theorem lean_workbook_plus_8521 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a^2 + b^2 + c^2)^2 > 2 * (a^4 + b^4 + c^4) → (a + b + c) * (a + b - c) * (a + c - b) * (b + c - a) > 0   := by
  intro h
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]