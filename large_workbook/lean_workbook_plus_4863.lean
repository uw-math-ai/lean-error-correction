theorem lean_workbook_plus_4863 (a b : ℕ) (ha : 1 < a) : a^b ≥ a * b   := by
  induction b <;> simp [*, pow_succ, mul_assoc, mul_comm, mul_left_comm]
  gcongr
  exact succ_le_of_lt (lt_pow_self ha _)