theorem lean_workbook_plus_5559 (a b c : ℝ) :
  10 * (a^3 + b^3 + c^3) * (a + b + c)^2 - 9 * (a^5 + b^5 + c^5) =
    (a + b + c)^5 + (15 / 2) * (a + b) * (a + c) * (b + c) * ((a - b)^2 + (a - c)^2 + (b - c)^2)   := by
  linarith [sq_nonneg (a + b + c), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]