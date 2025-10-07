theorem lean_workbook_plus_3034 (x : ℝ) (hx : 0 < x ∧ x < 1) : (2 * (1 - x)) / (x * (2 - x)) ≥ (1 / 25) * (138 - 234 * x)   := by
  have h1 : 0 < x ∧ x < 1 := hx
  have h2 := sq_nonneg (x - 1/3)
  field_simp [h1.1.ne', h1.2.ne']
  rw [div_le_div_iff] <;> nlinarith