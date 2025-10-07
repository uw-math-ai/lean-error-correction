theorem lean_workbook_plus_5971 (a b c d : ℝ) :
  -(b + d) * (c + a) * (a * c * d + a * b * d + a * b * c + b * c * d) + (a + b + c + d) * (a * b + c * d) * (b * c + a * d) =
  (a - c) ^ 2 * b * c * d + (b - d) ^ 2 * a * c * d + (c - a) ^ 2 * a * b * d + (d - b) ^ 2 * a * b * c   := by
  ring