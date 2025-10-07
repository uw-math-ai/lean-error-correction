theorem lean_workbook_plus_4424 (x y : ℝ) (h₀ : 0 < x) (h₁ : 0 < y) : x^2 + (8/(x*y)) + y^2 >= 8   := by
  have h₂ : 0 < x * y := mul_pos h₀ h₁
  field_simp [h₀, h₁, h₂]
  rw [le_div_iff h₂]
  nlinarith [sq_nonneg (x * y - 2), sq_nonneg (x - y)]