theorem lean_workbook_plus_93 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (a^2 / b^2 + b / (a + 3 * b)) ≥ 6 - 9 / (4:ℝ)^(1/3)   := by
  norm_num [pow_two, pow_three]
  simp [div_eq_mul_inv, mul_add, mul_comm, mul_left_comm]
  nlinarith [inv_pos.mpr hb, inv_pos.mpr (add_pos ha (mul_pos hb (by norm_num : (0 : ℝ) < 3)))] <;> nlinarith