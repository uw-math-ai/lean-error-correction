theorem lean_workbook_plus_8873 (ε : ℝ) (hε : 0 < ε) : ∃ n : ℤ, (1 : ℝ) / n < ε   := by
  refine' ⟨0, by simp [hε]⟩