theorem lean_workbook_plus_6109 (n : ℕ) (x : ℕ → ℂ) : ∑ j in Finset.range n, ‖x j‖ ≥ ‖∑ j in Finset.range n, x j‖   := by
  exact (norm_sum_le _ _).trans (le_of_eq (by simp [Finset.sum_range_succ]))