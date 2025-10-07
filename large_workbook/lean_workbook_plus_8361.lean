theorem lean_workbook_plus_8361 (x : ℝ) : x^2 - 59*x + 114 = 0 ↔ x = 2 ∨ x = 57   := by
  have h1 : x ^ 2 - 59 * x + 114 = (x - 2) * (x - 57) := by ring
  simp [h1, sub_eq_zero]