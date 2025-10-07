theorem lean_workbook_plus_1500 (x y : ℝ) : (1 + 1 / 4) * (x ^ 2 + 4 * y ^ 2) ≥ (x + y) ^ 2   := by
  field_simp [sq]
  nlinarith [sq_nonneg (4 * x - y), sq_nonneg (4 * y - x)]