theorem lean_workbook_plus_2424 (k : ℕ) : ∃ n : ℕ, ∃ x : ℕ, n * 2 ^ k - 7 = x ^ 2   := by
  refine' ⟨0, 0, by norm_num⟩