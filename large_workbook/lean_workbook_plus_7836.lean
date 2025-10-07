theorem lean_workbook_plus_7836 : ∀ x ∈ Set.Ioo (0 : ℝ) 1, Real.log (x + 1) - x < 0   := by
  rintro x ⟨hx_left, hx_right⟩
  have h₁ : 0 < x + 1 := by linarith
  have h₂ := log_lt_sub_one_of_pos h₁
  linarith [h₂ (by linarith)]