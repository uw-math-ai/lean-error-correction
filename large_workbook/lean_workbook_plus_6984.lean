theorem lean_workbook_plus_6984 (α β : ℝ) : (sin α - sin β) ^ 2 ≥ 0   := by
  nlinarith [sin_sq_add_cos_sq α, sin_sq_add_cos_sq β]