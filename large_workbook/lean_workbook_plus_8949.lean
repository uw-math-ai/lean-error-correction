theorem lean_workbook_plus_8949 (a b : ℝ) (ha : 1 ≤ a) (hb : 1 ≤ b) : (1 / (1 + a^2) + 1 / (1 + b^2)) ≥ 2 / (1 + a * b)   := by
  field_simp [ha, hb]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [mul_nonneg (sub_nonneg.mpr ha) (sub_nonneg.mpr hb), sq_nonneg (a - b), sq_nonneg (a + b)]