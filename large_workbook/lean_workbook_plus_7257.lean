theorem lean_workbook_plus_7257 {x y z : ℝ} (h : x + y + z = 2) : 2 * (x * y + y * z + z * x) * (1 + 6 * x * y * z) - 25 * x * y * z = y * (2 * y - 1) ^ 2 * (x - z) ^ 2 + z * (2 * z - 1) ^ 2 * (x - y) ^ 2 + x * (2 * x - 1) ^ 2 * (y - z) ^ 2   := by
  have h1 : x = 2 - y - z := by linarith
  subst h1
  ring