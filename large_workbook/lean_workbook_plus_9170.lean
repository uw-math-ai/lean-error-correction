theorem lean_workbook_plus_9170 (a b c : ℝ) : 2 * Real.sqrt (3 * (a ^ 6 + b ^ 6 + c ^ 6)) ≥ 2 * (a ^ 3 + b ^ 3 + c ^ 3)   := by
  refine' mul_le_mul_of_nonneg_left _ (by norm_num)
  exact le_sqrt_of_sq_le (by nlinarith [sq_nonneg (a^3 - b^3), sq_nonneg (b^3 - c^3), sq_nonneg (c^3 - a^3)])