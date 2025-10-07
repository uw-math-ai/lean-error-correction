theorem lean_workbook_plus_193 : ∀ a b c : ℤ, (a^3 + b^3 + c^3) - (a + b + c) = a*(a - 1)*(a + 1) + b*(b - 1)*(b + 1) + c*(c - 1)*(c + 1)   := by
  exact fun a b c ↦ by ring