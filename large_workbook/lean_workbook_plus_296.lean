theorem lean_workbook_plus_296 : ∀ n ≥ 2, (5 ^ n + 9 < 6 ^ n)   := by
  refine' Nat.le_induction _ _
  all_goals norm_num [pow_succ]
  exact fun n h₀ h₁ => by linarith [pow_pos (by norm_num : 0 < 5) n]