theorem lean_workbook_plus_7528 (x y z : ℝ) : x * y + z * x ≤ x ^ 2 + (y ^ 2 + z ^ 2) / 2   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - z)]