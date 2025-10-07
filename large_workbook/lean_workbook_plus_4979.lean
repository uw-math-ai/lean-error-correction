theorem lean_workbook_plus_4979 (r t : ℝ) (h₁ : r * t = 50) : t = 50 / r   := by
  have h₂ : r ≠ 0 := by intro h; simp [h] at h₁
  exact (by field_simp [h₂, h₁]; linarith)