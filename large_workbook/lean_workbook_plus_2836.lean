theorem lean_workbook_plus_2836 (n : ℕ) (x : Fin n → ℝ) (h : ∑ i, x i ^ 2 = 0) : ∀ i, x i = 0   := by
  rw [Finset.sum_eq_zero_iff_of_nonneg] at h
  exact fun i ↦ by simpa using h i (Finset.mem_univ _)
  exact fun i _ => sq_nonneg (x i)