theorem lean_workbook_plus_8562 (a x y : ℝ) (ha : 0 < a) : a^x * a^y = a^(x + y)   := by
  simp [← Real.rpow_add ha]