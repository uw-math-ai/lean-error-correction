theorem lean_workbook_plus_5786 : ∀ a < 1, 4 * (2 * a ^ 4 + 1) * (a ^ 2 + 2) ≥ a ^ 2 * (2 * a + 1) ^ 7 * (a + 1) ^ 2   := by
  simp (config := { contextual := true }) [sq]