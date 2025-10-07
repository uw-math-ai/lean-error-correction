theorem lean_workbook_plus_106 :  ∀ a b c : ℝ, (a + b + c) ^ 2 = (a + 2 * b) * (a + 2 * c) + (b - c) ^ 2   := by
  exact fun a b c ↦ by ring