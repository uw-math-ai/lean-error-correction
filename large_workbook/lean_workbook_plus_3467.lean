theorem lean_workbook_plus_3467 (a b : ℝ) : a / b + (a - b) / (a / b) = a / b + b * (a - b) / a   := by
  field_simp [mul_comm]