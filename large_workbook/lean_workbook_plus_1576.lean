theorem lean_workbook_plus_1576 (a b c : ℝ) (h : a + b + c = 0) : a^3 + b^3 + c^3 - 3 * a * b * c = 1 / 2 * (a + b + c) * ((a - b)^2 + (b - c)^2 + (c - a)^2)   := by
  nlinarith [h, h.symm]