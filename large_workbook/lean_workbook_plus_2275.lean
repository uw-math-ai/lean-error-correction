theorem lean_workbook_plus_2275 :
  (Real.tan (π / 36)) ∈ ({tan (π / 36), tan (13 * π / 36), tan (25 * π / 36)} : Set ℝ)   := by
  simp [show (13 : ℝ) * π / 36 = 13 * π / 36 by norm_num, show (25 : ℝ) * π / 36 = 25 * π / 36 by norm_num]