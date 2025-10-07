theorem lean_workbook_plus_9700 : ∀ a b : ℝ, a > 0 ∧ b > 0 → (1 / a + 2 / (a + b) : ℝ) ≤ 9 / 8 * (1 / a + 1 / b)   := by
  rintro x y ⟨hx, hy⟩
  field_simp [hx, hy]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (3 * x - y)]