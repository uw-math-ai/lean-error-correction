theorem lean_workbook_plus_6482 (x : ℝ) : 2.5 * x ^ 2 + 3 * x - 4 = 0 ↔ x = -2 ∨ x = 0.8   := by
  refine' ⟨fun h ↦ _, fun h ↦ _⟩ <;> aesop
  all_goals norm_num
  ring_nf at h
  have h1 : (x + 2) * (x - 4 / 5) = 0 := by linarith
  simpa [add_eq_zero_iff_eq_neg, sub_eq_zero] using h1