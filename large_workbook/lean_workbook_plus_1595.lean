theorem lean_workbook_plus_1595 (n : ℕ) (h : n > 1) : n + 2 = n + 2   := by
  simp [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc, h]