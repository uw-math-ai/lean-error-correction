theorem lean_workbook_plus_522 (n : ℕ) (x : ℕ → ℝ) : ∀ i : ℕ, i ≤ n → x i ≥ 0 → ∑ i in Finset.range n, (x i)^2 ≥ 0   := by
  exact fun i _ _ ↦ Finset.sum_nonneg (fun j _ ↦ sq_nonneg (x j))