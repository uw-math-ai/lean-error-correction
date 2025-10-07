theorem lean_workbook_plus_9957 (x : ℝ) (hx : x = (45 + 29 * Real.sqrt 2)^(1/3) + (45 - 29 * Real.sqrt 2)^(1/3)) : ∃ a : ℚ, a = x   := by
  ring_nf at hx
  exact ⟨2, by norm_num [hx]⟩