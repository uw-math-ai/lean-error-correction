theorem lean_workbook_plus_9132 (x y : ℝ) (h₁ : 2*x + 5*y ≥ 10) (h₂ : 3*x + 4*y ≥ 12) : 34 ≤ 8*x + 13*y   := by
  nlinarith [h₁, h₂]