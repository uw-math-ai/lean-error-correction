theorem lean_workbook_plus_7615  (x y k : ℝ)
  (h₀ : x + 1/y = k)
  (h₁ : y ≠ 0)
  (h₂ : k*y - 1 ≠ 0) :
  x = (k*y - 1)/y ∧ 1/x = y/(k*y - 1)   := by
  have h₃ : x = k - 1 / y := by linarith
  constructor <;> field_simp [h₁, h₂, h₃] <;> linarith [h₀, h₁, h₂, h₃]