theorem lean_workbook_plus_1571 (a b x : ℝ) : |a * sin x + b * cos x| ≤ Real.sqrt (a ^ 2 + b ^ 2)   := by
  apply Real.abs_le_sqrt
  nlinarith [sq_nonneg (a * cos x - b * sin x), sin_sq_add_cos_sq x]