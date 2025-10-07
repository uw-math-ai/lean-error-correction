theorem lean_workbook_plus_8018 (x : ℝ) (hx : 0 < x) : (Real.log x) / (x + 1) ≤ (Real.log (x + 1)) / x   := by
  gcongr
  exacts [log_nonneg (by linarith), by linarith, by linarith]