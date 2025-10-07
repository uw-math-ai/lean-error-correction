theorem lean_workbook_plus_727 (n : ℕ) (hn : n ≠ 0) : ‖(1 : ℂ) ^ (1 / n : ℂ)‖ = 1   := by
  simp [hn, norm_one]