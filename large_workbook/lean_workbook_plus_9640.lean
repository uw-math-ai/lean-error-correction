theorem lean_workbook_plus_9640 : ∀ n j : ℕ, ((n.choose j)^2 * j / (n - j + 1) : ℚ) = (n.choose j * (n.choose j * (j / (n - j + 1))))   := by
  exact fun n j ↦ by ring