theorem lean_workbook_plus_2762 : ∀ x > 0, x - Real.log (1 + x) > 0   := by
  intro x hx
  have h₁ : 0 < 1 + x := by linarith
  have h₂ := log_lt_sub_one_of_pos h₁
  linarith [h₂ (by linarith)]