theorem lean_workbook_plus_263 :
  Int.floor ((13 : ℝ) / 6)^2 = 4   := by
  rw [← Int.cast_ofNat]
  norm_cast