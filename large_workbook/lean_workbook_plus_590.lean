theorem lean_workbook_plus_590 (x y z k : ℤ) (h₁ : 0 < x ∧ 0 < y ∧ 0 < z) (h₂ : x < y) (h₃ : x + y = k) (h₄ : x^3 + y^3 = k * z^3) : z^3 = k^2 - 3 * k * x + 3 * x^2   := by
  rw [← h₃, pow_three]
  nlinarith [sq_nonneg (x - y)]