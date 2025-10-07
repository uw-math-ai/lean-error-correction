theorem lean_workbook_plus_8741 (S E G : ℝ) : S / (E + G) = 30 → E + G = S / 30   := by
  intro h
  have h1 : E + G ≠ 0 := by
  intro h2
  rw [h2] at h
  simp at h
  field_simp [h1] at h ⊢
  linarith [h1, h]