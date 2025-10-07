theorem lean_workbook_plus_2034 (z : ℂ) (hz : z = 2 * (cos (π / 3) + sin (π / 3) * I)) : z = 2 * (cos (π / 3) + sin (π / 3) * I)   := by
  simp [hz, Complex.ext_iff]