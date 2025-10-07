theorem lean_workbook_plus_7278 :
  8^Real.logb 2 (Real.sqrt 6) = 6 * Real.sqrt 6   := by
  rw [← Real.logb_eq_iff_rpow_eq] <;> norm_num
  norm_num [Real.logb]
  field_simp [Real.log_mul (by norm_num : (6 : ℝ) ≠ 0) (by norm_num : Real.sqrt 6 ≠ 0)]
  rw [show (8 : ℝ) = 2 * 2 * 2 by norm_num, Real.log_mul (by norm_num) (by norm_num)]
  field_simp [Real.log_mul (by norm_num : (2 : ℝ) ≠ 0) (by norm_num : (2 : ℝ) ≠ 0)]
  ring_nf
  simp [Real.log_mul, Real.log_sqrt]
  ring