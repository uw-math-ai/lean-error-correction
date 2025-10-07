theorem lean_workbook_plus_7389 (f : ℝ → ℝ) : (∃ x, 4*x^2 - 40 * Int.floor x + 51 = 0) ↔ ∃ x, 4*x^2 - 40 * Int.ceil x + 51 = 0   := by
  simp [Int.floor_eq_iff, Int.ceil_eq_iff]