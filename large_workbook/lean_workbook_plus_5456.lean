theorem lean_workbook_plus_5456 (x : ℂ) (hx1 : x^2 + x + 1 = 0) (hx2 : x^3 = 1) : x^2015 + x^2016 = -x   := by
  have h1 : x^3 - 1 = 0 := by rw [hx2, sub_self]
  ring_nf at h1 ⊢
  ring_nf at hx1 hx2 h1 ⊢
  have h2 := eq_neg_of_add_eq_zero_right hx1
  rw [h2] at hx1
  rw [← sub_eq_zero]
  simp [hx1, hx2, h2, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  have h3 := hx1
  simp [h1, h2, h3] at hx1 hx2 ⊢
  simp [hx1, hx2] at h1 h2 h3 ⊢
  have h4 : x ^ 3 - 1 = 0 := by rw [hx2]; ring
  ring_nf at h4 ⊢
  have h5 := hx2
  rw [hx2] at h5
  ring_nf at h1 h2 h3 h4 h5 ⊢
  simp [pow_two, pow_three] at h1 h2 h3 h4 h5 ⊢
  field_simp [hx1, h2, h3, h4, hx2] at h1 h2 h3 h4 ⊢
  ring_nf at h1 h2 h3 h4 ⊢
  have h6 : x^3 - 1 = 0 := by linear_combination hx2 - 1
  have h7 : x ^ 3 - 1 = 0 := by linear_combination h6
  rw [← sub_eq_zero] at h7
  have h8 := hx2
  rw [h8] at h7
  have h9 := hx2
  ring_nf at h1 h2 h3 h4 h5 h6 h7 h8 h9 ⊢
  simp [pow_two, pow_three] at h1 h2 h3 h4 h5 h6 h7 h8 h9 ⊢
  rw [← sub_eq_zero]
  rw [← sub_eq_zero]
  rw [show (2015 : ℕ) = 3 * 671 + 2 by norm_num, show (2016 : ℕ) = 3 * 672 by norm_num]
  field_simp [pow_add, pow_mul, pow_one] at h1 h3 h5 h2 h7 h4 h6 h8 h9 ⊢
  simp [hx2, h1, h2, h3, h4, h5, h6, h7, h8, h9]
  rw [← h9] at hx2
  rw [add_comm] at hx1
  ring_nf at h1 h3 h5 h2 h7 h4 h6 h8 h9 ⊢
  rw [← h9] at hx1
  rw [← h9] at h6
  have h10 := eq_neg_of_add_eq_zero_right h4
  ring_nf at h6 h8 h9 h10 ⊢
  rw [← sub_eq_zero]
  have h11 := h10
  ring_nf at h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 ⊢
  linear_combination h11 * -1