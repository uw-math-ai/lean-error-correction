theorem lean_workbook_plus_1522 (y : ℕ) (h : y = 2000 * 2015) : y + 28 = 4030028   := by
  simp [h, Nat.add_comm, Nat.add_left_comm, Nat.add_assoc]