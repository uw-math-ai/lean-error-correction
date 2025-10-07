theorem lean_workbook_plus_836 : ∀ a b c : ℂ, a^3 + b^3 + c^3 - 3 * a * b * c = (a + b + c) * (a^2 + b^2 + c^2 - a * b - b * c - c * a)   := by
  exact fun a b c ↦ by ring