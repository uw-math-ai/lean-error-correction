theorem lean_workbook_plus_8211 (x y : ℝ) (h₁ : x - y = 7) (h₂ : x * y = 8) : x^2 - y^2 = 63 ∨ x^2 - y^2 = -63   := by
  have h₃ : x ^ 2 - y ^ 2 = (x + y) * (x - y) := by ring
  simp [h₁, h₂, h₃, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  apply eq_or_eq_neg_of_sq_eq_sq _ _ <;> nlinarith