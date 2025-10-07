theorem lean_workbook_plus_2108 : ∀ {x y z t : ℝ}, x + y = y + z ∧ y + z = z + t ∧ z + t = t + x ↔ x = z ∧ y = t   := by
  exact fun {x y z t} ↦ ⟨fun h ↦ ⟨by linarith [h.1, h.2.1, h.2.2], by linarith [h.1, h.2.1, h.2.2]⟩,
  fun h ↦ ⟨by linarith [h.1, h.2], by linarith [h.1, h.2], by linarith [h.1, h.2]⟩⟩