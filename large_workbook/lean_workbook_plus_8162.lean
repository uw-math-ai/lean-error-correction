theorem lean_workbook_plus_8162 (t : ℝ) (ht : t > 0) : exp t > t + 1   := by
  norm_num [exp_pos]
  rw [← log_lt_iff_lt_exp (by linarith)]
  have := Real.log_lt_sub_one_of_pos (by linarith)
  refine' (log_lt_sub_one_of_pos _ (by linarith)).trans_le _
  all_goals nlinarith [sq_nonneg (t - 1), sq_nonneg (t - 2)]