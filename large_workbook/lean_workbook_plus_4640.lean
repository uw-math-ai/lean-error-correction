theorem lean_workbook_plus_4640 : ∀ N : ℕ, ∃ M : ℝ, ∀ n : ℕ, n ≥ N → M ≤ ∑ i in Finset.range n, (1 : ℝ) / i ^ (3 / 2)   := by
  refine' fun N => ⟨∑ i in Finset.range N, (1 : ℝ) / i ^ (3 / 2), fun n hn => _⟩
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hn) (by simp)