theorem lean_workbook_plus_7691 : ∀ a b c : ℝ, a^3 + b^3 + c^3 - 3*a*b*c = (a + b + c)*(a^2 + b^2 + c^2 - a*b - a*c - b*c)   := by
  exact fun a b c ↦ by ring