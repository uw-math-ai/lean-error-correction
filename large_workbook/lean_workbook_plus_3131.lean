theorem lean_workbook_plus_3131  (a b c : ℝ)
  (h₀ : 0 ≤ a ∧ 0 ≤ b ∧ 0 ≤ c)
  (h₁ : a ≥ b ∧ b ≥ c)
  (h₂ : a + b ≥ 2) :
  1 / (2 * a^2 + 3) + 1 / (2 * b^2 + 3) ≥ 4 / ((a + b)^2 + 6) ↔ (a - b)^2 * ((a + b)^2 + 2 * a * b - 3) ≥ 0   := by
  field_simp [h₀.1, h₀.2.1, h₀.2.2, h₁.1, h₁.2, h₂]
  rw [div_le_div_iff (by positivity) (by positivity)]
  constructor <;> intro h <;> linarith [h₀.1, h₀.2.1, h₀.2.2, h₁.1, h₁.2, h₂, h]