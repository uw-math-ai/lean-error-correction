theorem lean_workbook_plus_6173 ∃ r b w : ℕ, 10*r + 4*b + 1*w = 100 ∧ r + b + w = 25   := by
  refine' ⟨0, 25, 0, by norm_num, by norm_num⟩