theorem lean_workbook_plus_2941  (x y z : ℝ)
  (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) :
  4 / (x^2 + y * z) ≤ 1 / (x * y) + 1 / (x * z)   := by
  have h₁ : 0 < x * y := mul_pos h₀.1 h₀.2.1
  have h₂ : 0 < x * z := mul_pos h₀.1 h₀.2.2
  have h₃ : 0 < x^2 + y * z := add_pos (pow_pos h₀.1 2) (mul_pos h₀.2.1 h₀.2.2)
  field_simp [h₀.1, h₀.2.1, h₀.2.2, h₁, h₂, h₃]
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (x - y), sq_nonneg (x - z), h₁, h₂, h₃]