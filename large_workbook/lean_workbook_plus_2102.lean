theorem lean_workbook_plus_2102 (θ : ℝ) : sin (2 * θ) = 2 * tan θ / (1 + tan θ ^ 2)   := by
  field_simp [sin_two_mul, cos_sq', sin_sq]
  ring_nf
  rw [tan_eq_sin_div_cos]
  rw [← mul_right_inj' (two_ne_zero' ℝ)]
  rw [← sub_eq_zero]
  field_simp [sin_sq]
  have := cos_sq_add_sin_sq θ
  rw [← sub_eq_zero]
  have := cos_sq_add_sin_sq θ
  norm_num [cos_sq_add_sin_sq]
  have := cos_sq_add_sin_sq θ
  have := sin_sq_add_cos_sq θ
  rw [div_eq_mul_inv]
  cases' eq_or_ne (cos θ) 0 with h h <;> simp [h, mul_assoc]
  field_simp <;> ring