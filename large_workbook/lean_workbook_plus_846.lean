theorem lean_workbook_plus_846 : ∀ a b : ℝ, a * b = 0 → a = 0 ∨ b = 0   := by
  exact fun a b h ↦ eq_zero_or_eq_zero_of_mul_eq_zero h