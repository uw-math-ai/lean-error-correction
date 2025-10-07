theorem lean_workbook_plus_9009 : (2 / Real.sqrt (y * z) - 1)^2 ≥ 0   := by
  nlinarith [sq_nonneg (2 / Real.sqrt (y * z) - 1)]