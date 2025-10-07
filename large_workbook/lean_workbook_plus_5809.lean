theorem lean_workbook_plus_5809  (a b c d : ℝ) :
  (b + d) * (c + a) * (a * b^2 + b * c^2 + c * d^2 + a^2 * d) - 4 * (a + b + c + d) * a * b * c * d =
    (a * b - c * d)^2 * b + (a * d - b * c)^2 * a + (c * d - a * b)^2 * d + (b * c - a * d)^2 * c +
    (a - c)^2 * b * c * d + (b - d)^2 * a * c * d + (c - a)^2 * a * b * d + (d - b)^2 * a * b * c   := by
  ring