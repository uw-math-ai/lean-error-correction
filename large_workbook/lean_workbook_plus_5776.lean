theorem lean_workbook_plus_5776 (x y z : ℂ) (h : x * y * z = (1 - x) * (1 - y) * (1 - z)) :
  2 * x * y * z + x + y + z = x * y + y * z + z * x + 1   := by
  linear_combination h