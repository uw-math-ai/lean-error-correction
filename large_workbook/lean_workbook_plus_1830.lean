theorem lean_workbook_plus_1830 : ∀ a b c : ℝ, a > 0 ∧ b > 0 ∧ c > 0 → a / (2 * a + b + c) + b / (a + 2 * b + c) + c / (a + b + 2 * c) ≤ 3 / 4   := by
  rintro a b c ⟨h₁, h₂, h₃⟩
  field_simp [h₁, h₂, h₃]
  exact (div_le_div_iff (by positivity) (by positivity)).mpr (by nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)])