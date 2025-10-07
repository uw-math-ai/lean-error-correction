theorem lean_workbook_plus_9324 (a : ℝ) (h : sin a + cos a = 1/5) : sin a ^ 3 + cos a ^ 3 = 37/125   := by
  have h1 := sin_sq_add_cos_sq a
  have h2 := sin_sq_add_cos_sq a
  have h3 : sin a = 1 / 5 - cos a := by linarith
  field_simp [h1, h2, h3] at h ⊢
  nlinarith [h1, h2, h3, h]