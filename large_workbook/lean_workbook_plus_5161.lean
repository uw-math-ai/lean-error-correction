theorem lean_workbook_plus_5161 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (a + b) / 2 ≥ Real.sqrt (a * b)   := by
  have h1 : 0 ≤ (a - b)^2 := sq_nonneg (a - b)
  rw [ge_iff_le, sqrt_le_left] <;> nlinarith [ha, hb, h1]