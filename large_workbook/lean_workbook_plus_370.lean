theorem lean_workbook_plus_370 {x y z : ℝ} : x ^ 3 + y ^ 3 + z ^ 3 - 3 * x * y * z = (x + y + z) * (x ^ 2 + y ^ 2 + z ^ 2 - x * y - y * z - x * z)   := by
  ring