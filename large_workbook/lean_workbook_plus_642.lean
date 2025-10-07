theorem lean_workbook_plus_642 (x : ℝ) (hx : x = (2^(1/3) - 1)^(1/3)) : x = (1/9)^(1/3) - (2/9)^(1/3) + (4/9)^(1/3)   := by
  simp [hx, show (2 : ℝ) = (2 : ℝ) by rfl]