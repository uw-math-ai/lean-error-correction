theorem lean_workbook_plus_9408 (x : ℝ) (hx : x > 0 ∧ x ≠ 1) : x^((Real.log 30) / (Real.log x)) = 30   := by
  rw [← Real.logb_eq_iff_rpow_eq hx.1 hx.2] <;> norm_num [Real.logb]