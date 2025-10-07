theorem lean_workbook_plus_6055 (a : ℝ) (f : ℝ → ℝ → ℝ) (hf: ∀ u v : ℝ, u * v < 0 → f u v = a) : ∀ u v : ℝ, u * v < 0 → f u v = a   := by
  exact fun u v huv ↦ hf u v huv