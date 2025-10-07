theorem lean_workbook_plus_3911 : ∀ a b c : ℝ, a^3 + b^3 + c^3 - 3*a*b*c = (a + b + c)*(a^2 + b^2 + c^2) - (a^2*b + b^2*a + a^2*c + c^2*a + b^2*c + c^2*b) - 3*a*b*c   := by
  exact fun a b c ↦ by ring