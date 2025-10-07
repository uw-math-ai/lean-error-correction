theorem lean_workbook_plus_1984 (a b c : ℂ) : (c - a) * (c - b) = c^2 - a*c - b*c + a*b   := by
  linear_combination (c - a) * (c - b)