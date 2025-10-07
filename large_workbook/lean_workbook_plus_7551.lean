theorem lean_workbook_plus_7551 (x : ℝ) : (sin x)^4 + (cos x)^4 = 2 * (cos x)^4 + 1 - 2 * (cos x)^2   := by
  nlinarith [sin_sq_add_cos_sq x]