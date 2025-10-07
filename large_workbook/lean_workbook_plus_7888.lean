theorem lean_workbook_plus_7888 : (Real.sqrt 14)^2 = 14 ∧ (6 - Real.sqrt 3)^2 = 39 - 12 * Real.sqrt 3   := by
  constructor <;> norm_num [sqrt_eq_iff_sq_eq]
  norm_num [sq, sub_mul, mul_sub, mul_comm, mul_left_comm]
  ring