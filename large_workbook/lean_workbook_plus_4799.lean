theorem lean_workbook_plus_4799  (q e : ℚ)
  (h₀ : q = 3 / 5)
  (h₁ : e = 1 / 5) :
  q + e = 4 / 5   := by
  norm_num [h₀, h₁]