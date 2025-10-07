theorem lean_workbook_plus_6695 (x : ℝ) (hx : 0 < x ∧ x < 1) : (1 / (2 * x)) ≥ (3 / 2) - 2 * x ^ 2   := by
  field_simp [hx.1.ne', hx.2.ne']
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (x - 1 / 2)]