theorem lean_workbook_plus_6400  (p q a : ℂ)
  (h₀ : (3 * p * q - 1) = a * (p * q - p - q + 1)) :
  (a - 3) * p * q + a + 1 = a * (p + q)   := by
  linear_combination -h₀