theorem lean_workbook_plus_2039 : sin 30 * cos 10 - sin 10 * cos 30 = sin 20   := by
  rw [← sub_eq_zero]
  rw [show (30 : ℝ) = 20 + 10 by norm_num, show (10 : ℝ) = 20 - 10 by norm_num]
  simp [sub_eq_add_neg, sin_add, cos_add]
  ring_nf
  field_simp [sin_sq, cos_sq]
  simp [cos_two_mul, sin_sq]
  simp [cos_sq', sin_sq_add_cos_sq]
  nlinarith [sin_sq_add_cos_sq 10, sin_sq_add_cos_sq 20]