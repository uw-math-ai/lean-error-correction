theorem lean_workbook_plus_9038 (x : ℤ) : (x + 3)^2 = 3 * (x + 2)^2 - 3 * (x + 1)^2 + x^2   := by
  linear_combination 3 * (x + 2) ^ 2 - 3 * (x + 1) ^ 2 + x ^ 2 - (x + 3) ^ 2