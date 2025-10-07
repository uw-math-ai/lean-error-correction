theorem lean_workbook_plus_6915 : ∀ a b c : ℝ, a > 0 ∧ b > 0 ∧ c > 0 → (a + b) / (a + 2 * b) + (b + c) / (b + 2 * c) + (c + a) / (c + 2 * a) < 5 / 2   := by
  rintro a b c ⟨h₁, h₂, h₃⟩
  field_simp [h₁, h₂, h₃]
  rw [div_lt_div_iff] <;> nlinarith [mul_pos h₁ h₂, mul_pos h₂ h₃, mul_pos h₃ h₁]