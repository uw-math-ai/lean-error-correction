theorem lean_workbook_plus_386 (x t : ℂ) : (1 + 2 * x - t ^ 2) * t - x ^ 2 + x + x * (2 * x - t ^ 2) = 0 ↔ x = t ^ 2 - t ∨ x = -t - 1   := by
  apply Iff.intro <;> intro h <;> (have h1 := eq_or_ne x (t ^ 2 - t) <;> aesop)
  apply (mul_right_inj' (sub_ne_zero.2 h_1)).1
  linear_combination h
  all_goals ring