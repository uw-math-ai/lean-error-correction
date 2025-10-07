theorem lean_workbook_plus_3968 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a+b)*(b+c)*(c+a) ≥ (2*a*b*c*(a+b+c+1)^2)/(a*b+b*c+c*a+1)   := by
  field_simp [mul_add, add_mul, mul_comm, mul_assoc, mul_left_comm]
  rw [div_le_iff (by positivity)]
  nlinarith [sq_nonneg (a * b - c), sq_nonneg (b * c - a), sq_nonneg (a * c - b)]