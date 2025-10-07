theorem lean_workbook_plus_3642 (f : ℤ → ℝ) (hf: ∀ k > 0, f k + 4 / (f (k + 1))^2 = 3) : ∃ k, 0 < k ∧ ∀ k > 0, f k + 4 / (f (k + 1))^2 = 3   := by
  refine' ⟨1, by norm_num, fun k hk ↦ hf k hk⟩