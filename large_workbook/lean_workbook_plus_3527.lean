theorem lean_workbook_plus_3527 (x : ℝ) (hx : 0 < x ∧ x < 1) :
  x^(1/x) ≤ x^x   := by
  field_simp [hx.1, hx.2]
  exact (le_div_iff hx.1).mpr (by nlinarith [sq_nonneg (x - 1)])