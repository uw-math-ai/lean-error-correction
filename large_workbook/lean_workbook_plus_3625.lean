theorem lean_workbook_plus_3625 (r : ℝ) : (1 - 2 * r ≥ 0 ∧ r ≤ 1 / 2) ↔ r ≤ 1 / 2   := by
  refine' ⟨fun h ↦ by linarith [h.1, h.2], fun h ↦ ⟨by linarith, by linarith⟩⟩