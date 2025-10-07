theorem lean_workbook_plus_6172 : ∀ a b c d : ℝ, a = 20 ∧ b = 40 → c = 30 ∧ d = 10 → sin a + sin b = 2 * sin c * cos d   := by
  rintro a b c d ⟨rfl, rfl⟩ ⟨rfl, rfl⟩
  rw [show (20 : ℝ) = 30 - 10 by norm_num, show (40 : ℝ) = 30 + 10 by norm_num]
  simp [sin_add, sin_sub, mul_comm, mul_assoc, mul_left_comm]
  ring