theorem lean_workbook_plus_3100 (f : ℝ → ℝ) (hf: f = fun (x:ℝ) => x) : ∀ x > 0, f x = x   := by
  exact fun x hx => by simp [hf, hx]