theorem lean_workbook_plus_9981 (x y z : ℝ) (h : 7*x-3*y+0*z = 76) : 7*x-3*y = 76   := by
  linarith [h]