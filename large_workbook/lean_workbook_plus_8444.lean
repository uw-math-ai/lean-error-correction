theorem lean_workbook_plus_8444  (a : ℕ → NNReal)
  (n : ℕ) :
  0 ≤ ∑ i in Finset.range n, (Real.sqrt (a i)) * (1 / Real.sqrt (a i) - 1 / Real.sqrt (a (i + 1)))^2   := by
  exact Finset.sum_nonneg (fun i _ ↦ mul_nonneg (Real.sqrt_nonneg _) (sq_nonneg _))