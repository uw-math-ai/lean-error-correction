theorem lean_workbook_plus_7206 : ∀ x : ℝ, x^5 - x^2 + 3 ≥ x^3 + 2 ↔ (x - 1)^2 * (x + 1) * (x^2 + x + 1) ≥ 0   := by
  exact fun x ↦ ⟨fun h ↦ by nlinarith [h], fun h ↦ by nlinarith [h]⟩