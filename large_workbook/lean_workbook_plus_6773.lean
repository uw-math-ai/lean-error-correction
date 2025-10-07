theorem lean_workbook_plus_6773 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : 8 * (a^2 + 2)^2 * (b^2 + 2)^2 ≥ 81 * (a + b)^2 + 36 * a * b * (a^2 + 2) * (b^2 + 2)   := by
  ring_nf
  simp [add_assoc, add_comm, add_left_comm]
  have h1 : 0 ≤ (a - b)^2 := sq_nonneg (a - b)
  have h2 := sq_nonneg (a^2 - b^2)
  nlinarith [sq_nonneg (a * b - 1), sq_nonneg (a * b - 2), sq_nonneg (a * b - 3)]