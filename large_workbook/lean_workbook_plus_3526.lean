theorem lean_workbook_plus_3526 : (6 : ℝ) ≤ (9 * Real.sqrt 2) / 2   := by
  rw [le_div_iff two_pos]
  have h1 : (Real.sqrt 2)^2 = 2 := by norm_num [Real.sqrt_eq_iff_sq_eq]
  nlinarith [Real.sqrt_nonneg 2]