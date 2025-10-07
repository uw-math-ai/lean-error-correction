theorem lean_workbook_plus_3039 (x y : ℝ) : Matrix.det (![![y, x, x+y],![x+y, y, x],![x, x+y, y]]) = 2 * (x^3 + y^3)   := by
  simp [Matrix.det_fin_three]
  ring