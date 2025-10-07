theorem lean_workbook_plus_3711 (f : ℝ → ℝ) (hf : ∀ x, f (f x) = x^2 + 1/4) : f (1/2) = 1/2   := by
  have h1 := hf (f (1 / 2))
  norm_num [hf] at h1 ⊢
  nlinarith [sq_nonneg (f (1 / 2) - 1 / 2)]