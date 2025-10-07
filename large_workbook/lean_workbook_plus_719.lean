theorem lean_workbook_plus_719 (x y : ℝ) : (abs (x + y) / (1 + abs (x + y))) ≤ abs x / (1 + abs x) + abs y / (1 + abs y)   := by
  have h₁ : 0 ≤ |x + y| := abs_nonneg (x + y)
  have h₂ : 0 ≤ |x| := abs_nonneg x
  have h₃ : 0 ≤ |y| := abs_nonneg y
  field_simp [h₁, h₂, h₃]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [abs_add x y, abs_mul x y, abs_nonneg (x * y)]