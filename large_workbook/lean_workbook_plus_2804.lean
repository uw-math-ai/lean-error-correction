theorem lean_workbook_plus_2804 (x y z : ℝ) (h₀ : 2 ≤ x ∧ x ≤ 3) (h₁ : y = 4 - x) (h₂ : z = -1) : x^2 + y^2 + z^2 ≤ 11   := by
  simp [h₁, h₂, h₀.1, h₀.2]
  nlinarith [h₀.1, h₀.2, h₁, h₂]