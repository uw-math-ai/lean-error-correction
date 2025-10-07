theorem lean_workbook_plus_9731 (n : ℤ) (hn : abs n > 2) : (2 * n ^ 2 + n - 2) ^ 2 < 4 * (n ^ 4 + n ^ 3 + 1) ∧ 4 * (n ^ 4 + n ^ 3 + 1) < (2 * n ^ 2 + n) ^ 2   := by
  refine ⟨?_,?_⟩
  all_goals cases abs_cases n <;> nlinarith