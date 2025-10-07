theorem lean_workbook_plus_3707  (x y : ℝ)
  (h₀ : 0 < x ∧ 0 < y)
  (h₁ : x + y = 7)
  (h₂ : (x^2 + y^2) / (x * y) = 25 / 12) :
  x * y = 12   := by
  field_simp [h₀.1.ne', h₀.2.ne'] at h₂ ⊢
  nlinarith [sq_nonneg (x - y), h₀.1, h₀.2, h₁, h₂]