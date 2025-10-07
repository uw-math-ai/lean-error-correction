theorem lean_workbook_plus_2967  (s v : ℝ)
  (h₀ : 0 < s ∧ 0 < v)
  (h₁ : v * (114 / 100) = s * (94 / 100)) :
  s / v = 57 / 47   := by
  rw [div_eq_iff] <;> linarith [h₀.1, h₀.2, h₁]