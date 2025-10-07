theorem lean_workbook_plus_1670 (x y : ℝ) (h₁ : x ≠ 0 ∧ y ≠ 0) (h₂ : x * y = 3) (h₃ : x / y + y / x = 4) : x * y * (x + y) ^ 2 - 2 * x ^ 2 * y ^ 2 = 36   := by
  field_simp [h₁.1, h₁.2, h₂] at h₃ ⊢
  nlinarith [h₁.1, h₁.2, h₂, h₃]