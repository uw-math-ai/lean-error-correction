theorem lean_workbook_plus_4164 {a b c : ℝ} : a^2 + b^2 + c^2 - (a * b + b * c + c * a) ≥ 3 * (a - b) * (b - c)   := by
  simp [sq, mul_add, add_mul]
  nlinarith [sq_nonneg (a - b - (b - c))]