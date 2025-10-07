theorem lean_workbook_plus_4532 (a b c d : ℝ) (p : ℝ → ℝ) (h₁ : p = fun x => x^4 + a*x^3 + b*x^2 + c*x + d) : p 1 = 10 ∧ p 2 = 20 ∧ p 3 = 30 → (p 12 + p (-8)) / 10 = 1984   := by
  simp only [h₁]
  refine' fun h => by linarith [h.1, h.2.1, h.2.2]