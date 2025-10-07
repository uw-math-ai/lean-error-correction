theorem lean_workbook_plus_5788 (x : ℝ) : (x^2+x+9)+(5*x^2+9*x+2) = 6*x^2+10*x+11   := by
  linarith [sq_nonneg (x + 1), sq_nonneg (x + 2)]