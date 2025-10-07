theorem lean_workbook_plus_3380 : ∀ a b c : ℝ, a^2 + b^2 + c^2 ≥ 3 * (a^2 * b^2 * c^2)^(1/3) ↔ a^2 + b^2 + c^2 ≥ 3 * (a^2 * b^2 * c^2)^(1/3)   := by
  exact fun a b c ↦ ⟨fun h ↦ h, fun h ↦ h⟩