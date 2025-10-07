theorem lean_workbook_plus_7727 (a b : ℝ) (ha : a ≠ 0) (hb : b ≠ 0) : (a + b) * (1 / a + 1 / b) - 4 = (a - b) ^ 2 / (a * b)   := by
  field_simp [ha, hb]
  ring