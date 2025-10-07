theorem lean_workbook_plus_9645 (a b c d : ℝ) (h : a * c + b * d = 0) :
  (a + b + c + d) / 2 ≤ Real.sqrt ((a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) / 2)   := by
  exact Real.le_sqrt_of_sq_le (by linarith [sq_nonneg (a - b + c - d)])