theorem lean_workbook_plus_5725 (y z : ℝ) (hy : y > 0) (hz : z > 0) : (y + z) / (4 * y * z) ≥ 1 / (y + z)   := by
  field_simp [hy, hz]
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (y - z)]