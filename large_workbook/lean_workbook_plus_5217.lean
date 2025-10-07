theorem lean_workbook_plus_5217 33 >= 3 * a ∧ 3 * a >= 3 → 11 >= a ∧ a >= 1   := by
  exact fun h ↦ ⟨by linarith [h.1], by linarith [h.2]⟩