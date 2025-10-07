theorem lean_workbook_plus_6121 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) : √x * √y = x^((1:ℝ)/2) * y^((1:ℝ)/2)   := by
  simp [Real.sqrt_eq_rpow, hx, hy]