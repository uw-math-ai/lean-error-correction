theorem lean_workbook_plus_4763 (β : ℝ) : (sin β - 1) ^ 2 ≥ 0   := by
  nlinarith [sin_sq_add_cos_sq β]