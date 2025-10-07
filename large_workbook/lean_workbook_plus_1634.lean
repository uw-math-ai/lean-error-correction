theorem lean_workbook_plus_1634 (h₁ : 117 + 11 + 2 = 130) : 117 + 11 + 2 = 130   := by
  simp only [h₁, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]