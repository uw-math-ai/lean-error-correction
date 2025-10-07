theorem lean_workbook_plus_3062 {p : ℝ} (hp : p ≥ 3) : 2 * (4 / 5 - 3 * (p ^ 2 - 6) / (5 * p ^ 2)) ≥ 3 - 3 * p / 5   := by
  field_simp [hp]
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (p - 2)]