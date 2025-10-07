theorem lean_workbook_plus_402  (p q r a b : ℝ)
  (h₀ : p + q + r = 1 / a)
  (h₁ : p * q + q * r + r * p = b / a) :
  a * b = (p * q + q * r + r * p) / (p + q + r)^2   := by
  field_simp [h₀, h₁, sq]
  ring_nf at h₀ h₁ ⊢
  field_simp [h₀, h₁, sq]