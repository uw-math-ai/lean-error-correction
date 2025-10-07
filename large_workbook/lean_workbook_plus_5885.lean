theorem lean_workbook_plus_5885 :
  (sin α + cos β + 1)^2 ≥ 2 * (sin α + 1) * (cos β + 1) → sin α ^ 2 ≥ sin β ^ 2   := by
  intro h
  nlinarith [sin_sq_add_cos_sq α, sin_sq_add_cos_sq β]