theorem lean_workbook_plus_774 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) : (x + y + 2)⁻¹ - (x + 1)⁻¹ * (y + 1)⁻¹ ≤ 16⁻¹   := by
  field_simp [hx, hy]
  rw [div_le_iff (by positivity)]
  nlinarith [sq_nonneg (x + 1 - 4), sq_nonneg (y + 1 - 4)]