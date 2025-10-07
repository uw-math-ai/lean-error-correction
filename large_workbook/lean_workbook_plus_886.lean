theorem lean_workbook_plus_886 : ∀ x, sin x = 2 * sin (x / 2) * cos (x / 2)   := by
  exact fun x ↦ by rw [← Real.sin_two_mul, mul_div_cancel' _ two_ne_zero]