theorem lean_workbook_plus_3415 (f : ℝ → ℝ) (hf : ∀ x, f (f x) = 1 - x) : f (1 / 4) + f (3 / 4) = 1   := by
  have h1 := hf (f (1 / 4))
  simp [hf] at h1
  norm_num at h1
  linarith [hf (1 / 4), hf (3 / 4)]