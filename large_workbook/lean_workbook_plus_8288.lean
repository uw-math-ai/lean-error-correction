theorem lean_workbook_plus_8288 (a : ℝ) (ha : 0 < a) : (a^2 / (a + 1)) ≥ (3/4 * a - 1/4)   := by
  field_simp [ha.ne']
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (a - 1), sq_nonneg a]