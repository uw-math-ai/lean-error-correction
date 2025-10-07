theorem lean_workbook_plus_8149 (n : ℕ) : (n^n / (2^n)^2 : ℝ) = (n / 4)^n   := by
  field_simp [pow_two]
  rw [show (4 : ℝ) = 2 * 2 by norm_num, mul_pow]