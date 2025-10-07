theorem lean_workbook_plus_7134 (x y : ℝ) : 2 * (1 + x^2 * y^2) / (x * y) = 2 * (1 / (x * y) + x * y)   := by
  rw [div_eq_mul_inv]
  by_cases hx : x = 0 <;> by_cases hy : y = 0 <;> simp [hx, hy]
  field_simp <;> ring