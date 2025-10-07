theorem lean_workbook_plus_5395  (x : ℝ)
  (h₀ : 0 < x)
  (h₁ : x < 1) :
  (1 - x) ^ 3 / (1 + 2 * x) ≥ 116 / 225 - 76 * x / 75   := by
  field_simp [h₁.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - 1/3), sq_nonneg (x - 1/2)]