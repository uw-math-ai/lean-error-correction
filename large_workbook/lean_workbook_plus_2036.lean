theorem lean_workbook_plus_2036 (x y t a : ℝ) : x = a * Real.sin t ∧ y = a * Real.cos t ↔ x = a * Real.sin t ∧ y = a * Real.cos t   := by
  exact ⟨fun h ↦ ⟨h.1, h.2⟩, fun h ↦ ⟨h.1, h.2⟩⟩