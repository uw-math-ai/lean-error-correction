theorem lean_workbook_plus_9398 (x y z : ℝ) (h : x + y + z >= x * y * z) : x ^ 2 + y ^ 2 + z ^ 2 >= x * y * z   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]