theorem lean_workbook_plus_1383 (x y z : ℝ) : (x ^ 2 / 4 + y ^ 2 + z ^ 2) ≥ x * y - x * z + 2 * y * z   := by
  nlinarith [sq_nonneg (x / 2 - y + z)]