theorem lean_workbook_plus_9855 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (2 * a / (a + b) + b / (2 * a)) ≥ 1 / 2 * ((a - b) / (a + b)) ^ 2   := by
  field_simp [ha, hb]
  rw [div_le_div_iff] <;> nlinarith [mul_pos ha hb]