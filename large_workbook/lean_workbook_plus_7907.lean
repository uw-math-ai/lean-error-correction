theorem lean_workbook_plus_7907 : ∀ x : ℝ, x^3 ≥ x ↔ x * (x^2 - 1) ≥ 0   := by
  exact fun x ↦ ⟨fun h ↦ by nlinarith [h], fun h ↦ by nlinarith [h]⟩