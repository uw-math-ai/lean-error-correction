theorem lean_workbook_plus_705 (n : ℕ) (hn : 0 < n) : n = 1 + n - 1   := by
  simp [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc, hn]