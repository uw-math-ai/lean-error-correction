theorem lean_workbook_plus_1577 (z : ℝ) (hz : -1/3 ≤ z) : z / (z^2 + 1) ≤ 1/2   := by
  have h1 : 0 ≤ (z - 1)^2 := sq_nonneg (z - 1)
  rw [div_le_iff] <;> nlinarith