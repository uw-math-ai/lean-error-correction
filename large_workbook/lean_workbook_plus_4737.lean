theorem lean_workbook_plus_4737 : 4 = a * b + b * c + a * c + a * b * c ∧ a * b * c ≥ 3 * (a * b * c)^(2/3) + a * b * c → a * b * c ≤ 1   := by
  simp [sq, mul_add, mul_comm, mul_left_comm]