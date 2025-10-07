theorem lean_workbook_plus_9473 (x y : ℝ) (h₁ : x / y = 6.5 / 9.1) : y = 9.1 / 6.5 * x   := by
  field_simp [eq_comm] at h₁ ⊢
  norm_num at h₁ ⊢
  rw [eq_comm] at h₁
  field_simp at h₁ ⊢
  have h₂ : y ≠ 0 := by
  rintro rfl
  simp at h₁
  field_simp [h₂] at h₁
  linarith [h₁, h₂]