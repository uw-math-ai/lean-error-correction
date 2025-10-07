theorem lean_workbook_plus_523 : ∀ x : ℝ, x ≠ 1 → (x^2 + x + 1) / (x - 1) ^ 2 ≥ 1 / 4   := by
  intro x hx
  rw [ge_iff_le, le_div_iff (sq_pos_of_ne_zero (x - 1) (sub_ne_zero_of_ne hx))]
  nlinarith [sq_nonneg (x - 1), sq_nonneg (x + 1)]