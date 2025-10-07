theorem lean_workbook_plus_7000  (x y z : ℝ)
  (a b c : ℝ)
  (h₀ : x ≠ 0 ∧ y ≠ 0 ∧ z ≠ 0)
  (h₁ : a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0)
  (h₂ : a * b * c = 1)
  (h₃ : a = x / y)
  (h₄ : b = y / z)
  (h₅ : c = z / x) :
  x / y * (y / z) * (z / x) = 1   := by
  field_simp [h₀.1, h₀.2.1, h₀.2.2, h₁.1, h₁.2.1, h₁.2.2, h₂, h₃, h₄, h₅]