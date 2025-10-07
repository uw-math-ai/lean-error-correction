theorem lean_workbook_plus_2749 (a b : ℝ) : (a + b) / (1 + a^2 + b^2) ≤ 1 / Real.sqrt 2   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  ring_nf at a b ⊢
  have h : 0 ≤ (a - b) ^ 2 := sq_nonneg (a - b)
  field_simp [sq] at h ⊢
  apply le_of_sub_nonneg
  have h' : 0 ≤ (Real.sqrt 2 - (a + b))^2 := sq_nonneg (Real.sqrt 2 - (a + b))
  ring_nf at h h' ⊢
  field_simp [h] at h' ⊢
  exact div_nonneg (by nlinarith [sq_nonneg (a * √2 - b * √2 - 1), sq_nonneg (a * √2 + b * √2 - 1)]) (by positivity)