theorem lean_workbook_plus_7806 (a b c : ℝ) (h : a + b + c = 0) (h' : a * b + b * c + c * a = 3 / 2) : a ^ 2 + b ^ 2 + c ^ 2 = -3   := by
  nlinarith [h, h']