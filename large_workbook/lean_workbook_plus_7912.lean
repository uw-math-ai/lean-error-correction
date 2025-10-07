theorem lean_workbook_plus_7912 : ∀ a b : ℝ, (a^2 - a + 1) * (b^2 - b + 1) ≥ (a^2 + b^2) / 2 ∧ (a^2 + b^2) / 2 ≥ (a^2 + a*b + b^2) / 3   := by
  refine' fun a b => ⟨_, _⟩
  ring_nf
  repeat' nlinarith [sq_nonneg (a - b)]
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1), sq_nonneg (a * b - 1)]