theorem lean_workbook_plus_8566  (n : ℤ)
  (h₀ : 4 * n + 3 = 1351) :
  n = 337   := by
  linarith [h₀]