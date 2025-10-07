theorem lean_workbook_plus_7745 : ∀ a b c d : ℝ, a + b + c + d = 0 → a^3 + b^3 + c^3 + d^3 = 3 * (a * b * c + b * c * d + c * d * a + d * a * b)   := by
  intro a b c d h
  rw [eq_neg_of_add_eq_zero_right h]
  ring