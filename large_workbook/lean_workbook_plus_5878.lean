theorem lean_workbook_plus_5878 (a b c : ℝ) : (a^2 + ab + b^2)^(1/3) + (b^2 + bc + c^2)^(1/3) + (c^2 + ca + a^2)^(1/3) ≥ 3 * (ab + bc + ca)^(1/3)   := by
  norm_num [sq_nonneg, add_nonneg, mul_nonneg]