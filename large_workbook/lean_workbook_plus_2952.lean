theorem lean_workbook_plus_2952 (a b c : ℕ) (h₁ : a = a) (h₂ : b = a + 2) (h₃ : c = a + 1) : a + b + c = a + a + 2 + a + 1   := by
  simp [h₁, h₂, h₃, add_assoc, add_comm, add_left_comm]