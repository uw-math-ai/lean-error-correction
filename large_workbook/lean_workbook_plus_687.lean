theorem lean_workbook_plus_687 (x : ℝ) (hx : x > 0) : Real.exp x > x + 1   := by
  have h1 : 0 < x + 1 := by linarith
  rw [← add_zero (x + 1)]
  have h2 : 0 < 1 + x := by linarith
  simp [exp_pos]
  rw [←log_lt_iff_lt_exp (by positivity)]
  have h3 := log_lt_sub_one_of_pos h1
  nlinarith [h3 (by linarith)]