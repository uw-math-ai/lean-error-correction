theorem lean_workbook_plus_8411 (a b : ℝ) (f : ℝ → ℝ) (h₁ : f = fun x => a * x + b * x + x + 5) : f (-4) = 3 → f 4 = 7   := by
  simp [h₁]
  exact fun h => by linarith [h]