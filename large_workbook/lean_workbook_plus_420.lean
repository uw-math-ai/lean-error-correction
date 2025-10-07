theorem lean_workbook_plus_420 (x x1 x2 S P : ℂ) (hx : x ≠ x1 ∧ x ≠ x2) (hS : S = x1 + x2) (hP : P = x1 * x2) : (x - x1) * (x - x2) = x^2 - S * x + P   := by
  simp [hS, hP, sub_mul, mul_sub, mul_comm, mul_assoc, mul_left_comm]
  linear_combination x^2 - x * (x1 + x2) + x1 * x2