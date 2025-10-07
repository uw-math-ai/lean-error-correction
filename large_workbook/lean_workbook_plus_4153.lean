theorem lean_workbook_plus_4153  (a b c : ℕ)
  (h₀ : a^2 + b^2 + c^2 = 2 * (a * b + b * c + c * a)) :
  (a + b + c)^2 = 4 * (a * b + b * c + c * a)   := by
  linarith [sq (a + b + c), h₀]