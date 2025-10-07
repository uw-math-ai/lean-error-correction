theorem lean_workbook_plus_8207  (x y : ℝ)
  (h₀ : x ≠ 0)
  (h₁ : y ≠ 0) :
  (x + 1/x) * (y + 1/y) + (x - 1/x) * (y - 1/y) = 2 * x * y + 2 / (x * y)   := by
  ring