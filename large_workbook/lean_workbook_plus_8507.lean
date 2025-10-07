theorem lean_workbook_plus_8507 : ∀ n : ℕ, ∑ k in Finset.range (n+1), (1 : ℝ) / (k * (k + 1) * (k + 2)) = 1 / 2 * (1 / 2 - 1 / (n + 1) / (n + 2))   := by
  intro n
  induction n <;> field_simp [Finset.sum_range_succ, *] <;> ring