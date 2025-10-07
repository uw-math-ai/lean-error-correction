theorem lean_workbook_plus_5103 : ∀ x : ℝ, 0 ≤ x ∧ x ≤ 1 → 1 / (x ^ 2 - 4 * x + 9) ≤ (x + 2) / 18   := by
  intro x hx
  have h1 : 0 ≤ (x - 1)^2 := sq_nonneg (x - 1)
  rw [div_le_div_iff] <;> nlinarith