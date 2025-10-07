theorem lean_workbook_plus_4019 : 2*c^2 + (a+b-c)^2 ≥ 0   := by
  nlinarith [sq_nonneg (a + b - c), sq_nonneg c]