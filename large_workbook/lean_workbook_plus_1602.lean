theorem lean_workbook_plus_1602 : ∀ x : ℝ, 0 ≤ x ∧ x ≤ 1 → x^2 - x + 2 ≤ 2   := by
  exact fun x hx ↦ by nlinarith [hx.1, hx.2]