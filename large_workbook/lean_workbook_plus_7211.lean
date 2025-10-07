theorem lean_workbook_plus_7211 (a b : ℝ) : (a^2+b^2+6*a*b)*(3*a^2+2*a*b+3*b^2) ≤ 4*(a+b)^4   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]