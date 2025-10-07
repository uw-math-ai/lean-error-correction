theorem lean_workbook_plus_3068  (x y : ℝ) :
  (x - y)^2 ≥ 0 → x * y ≤ (x^2 + y^2) / 2   := by
  exact fun h ↦ by linarith [sq_nonneg (x - y)]