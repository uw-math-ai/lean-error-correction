theorem lean_workbook_plus_1843 (a : ℝ) (h : a = 10) : Real.sqrt (10 * 4 * 3 * 3) = 6 * Real.sqrt 10   := by
  rw [show (10 * 4 * 3 * 3 : ℝ) = 6 * 6 * 10 by norm_num]
  field_simp [Real.sqrt_eq_iff_sq_eq]