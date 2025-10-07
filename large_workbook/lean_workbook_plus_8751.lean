theorem lean_workbook_plus_8751 (θ : ℝ) : (sin θ)^2 + (cos θ)^2 = 1   := by
  simp [sin_sq, cos_sq, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]