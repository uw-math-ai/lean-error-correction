theorem lean_workbook_plus_8351 (x y α β : ℝ) : (x * β - y * α) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (x * β - y * α)]