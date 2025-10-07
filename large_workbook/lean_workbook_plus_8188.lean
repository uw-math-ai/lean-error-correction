theorem lean_workbook_plus_8188 (x : ℝ): x > 0 → x > Real.log (x + 1)   := by
  intro hx
  have := Real.log_lt_sub_one_of_pos (add_pos hx zero_lt_one)
  simpa [add_comm] using this (by linarith)