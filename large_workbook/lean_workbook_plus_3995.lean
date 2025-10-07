theorem lean_workbook_plus_3995 :
  (10:ℝ)^30 < 2^100 ∧ 2^100 < (10:ℝ)^31   := by
  norm_num [pow_succ, pow_zero, pow_one, mul_one, mul_comm, mul_assoc, mul_left_comm]