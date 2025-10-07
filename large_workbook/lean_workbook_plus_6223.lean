theorem lean_workbook_plus_6223 : ∀ a b c : ℝ, a ≥ 1 ∧ b ≥ 1 ∧ c ≥ 1 ∧ a + b + c = 5 → a * b * c ≥ 3   := by
  rintro a b c ⟨h₁, h₂, h₃, h₄⟩
  nlinarith [mul_nonneg (sub_nonneg.mpr h₁) (sub_nonneg.mpr h₂), h₄]