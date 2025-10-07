theorem lean_workbook_plus_3627 (a b : ℝ) : (|a + b| / (1 + |a + b|)) ≤ (|a| / (1 + |a|)) + (|b| / (1 + |b|))   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  have h₁ : 0 ≤ |a + b| := abs_nonneg (a + b)
  nlinarith [abs_add a b, abs_mul a b, abs_nonneg (a * b)]