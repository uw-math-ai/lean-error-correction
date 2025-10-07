theorem lean_workbook_plus_2528 (x : ℝ) (hx : 0 ≤ x ∧ x ≤ 2) : (3 / (1 + x) ≤ 3 - 1 / 2 * x ^ 2)   := by
  rw [div_le_iff] <;> nlinarith