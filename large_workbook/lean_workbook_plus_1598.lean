theorem lean_workbook_plus_1598 (x y : ℝ) : |x + y| / (1 + |x + y|) ≤ |x| / (1 + |x|) + |y| / (1 + |y|)   := by
  have h₁ := abs_add x y
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [div_le_div_iff (by positivity) (by positivity)]
  have h₂ := abs_add (x * y) 1
  have h₃ := abs_add x y
  have h₄ := abs_mul x y
  nlinarith [abs_nonneg (x * y + 1), abs_nonneg (x + y), abs_nonneg (x * y), abs_nonneg x, abs_nonneg y]