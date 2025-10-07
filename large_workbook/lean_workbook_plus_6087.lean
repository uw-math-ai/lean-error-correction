theorem lean_workbook_plus_6087 (z c : ℂ) : 7 - 4 * z = 13 * c ↔ z = (7 - 13 * c) / 4   := by
  exact ⟨fun h ↦ by rw [← h]; ring, fun h ↦ by rw [h]; ring⟩