theorem lean_workbook_plus_2601 : x = y ∧ y = z ∧ z = 0 → x = 0 ∧ y = 0 ∧ z = 0   := by
  exact by rintro ⟨rfl, rfl, rfl⟩; simp