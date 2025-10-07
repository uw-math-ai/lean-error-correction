theorem lean_workbook_plus_7077 (x y t : ℝ) (h₁ : x = 4 * t - Real.sin t) (h₂ : y = 4 - Real.cos t) : x^2 + y^2 = (4 * t - Real.sin t)^2 + (4 - Real.cos t)^2   := by
  simp [h₁, h₂, sq]