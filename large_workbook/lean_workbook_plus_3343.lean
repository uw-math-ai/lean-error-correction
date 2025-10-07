theorem lean_workbook_plus_3343 (f : ℝ → ℝ) (hf1 : f 1 = 2) (hf2 : ∀ x, f (x + 1) + f x = 1) : ∀ x, f (x + 2) = f x   := by
  intro x
  rw [show x + 2 = x + 1 + 1 by ring]
  linarith [hf1, hf2 x, hf2 (x + 1)]