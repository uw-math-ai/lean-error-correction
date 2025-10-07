theorem lean_workbook_plus_6357 : ∃ n : ℕ, n > 1 ∧ ∃ k : ℕ, (∑ i in Finset.range n, i ^ 2) / n = k ^ 2   := by
  refine ⟨2, by norm_num, 0,?_⟩
  simp [Finset.sum_range_succ, Finset.sum_range_zero]