theorem lean_workbook_plus_6274 (x : ℂ) : (Real.sqrt (-3) / (x ^ 2 + x + 1) : ℂ) = 1 / (x + 1 / 2 - Real.sqrt (-3) / 2) - 1 / (x + 1 / 2 + Real.sqrt (-3) / 2)   := by
  simp [add_assoc, add_comm, add_left_comm]
  field_simp [Real.sqrt]