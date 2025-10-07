theorem lean_workbook_plus_5850 (a b c d e : ℝ) (h : a = 0 ∨ b = 0 ∨ c = 0 ∨ d = 0 ∨ e = 0) : b^4 + c^4 + d^4 + e^4 ≥ 4 * b * c * d * e   := by
  rcases h with (rfl | rfl | rfl | rfl | rfl) <;> simp [sq]
  any_goals positivity
  have key : 0 ≤ (b^2 - c^2)^2 + (c^2 - d^2)^2 + (d^2 - e^2)^2 + (e^2 - b^2)^2 := by positivity
  nlinarith [sq_nonneg (b * d - c * e), sq_nonneg (b * e - c * d), key]