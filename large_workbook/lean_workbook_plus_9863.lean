theorem lean_workbook_plus_9863  (A B : Matrix (Fin 2) (Fin 2) ℝ) :
  2 * A.trace * B.trace - 2 * (A * B).trace + 2 * A.det + 2 * B.det - 2 * (A + B).det = 0   := by
  simp [Matrix.det_fin_two, Matrix.trace_fin_two, Matrix.mul_apply, Matrix.add_apply,
  pow_two, Fin.sum_univ_two, mul_add, add_mul, mul_comm, mul_left_comm, sub_eq_add_neg, add_assoc]
  ring