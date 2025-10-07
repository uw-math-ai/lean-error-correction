theorem lean_workbook_plus_8737 (n : ℕ) : ∑ i in Finset.range n, i^3 ≤ n^4   := by
  induction' n with n ih
  simp [Finset.sum_range_zero]
  calc
  ∑ i in Finset.range (n + 1), i ^ 3 = ∑ i in Finset.range n, i ^ 3 + n ^ 3 := by
    rw [Finset.sum_range_succ]
  _ ≤ n ^ 4 + n ^ 3 := (add_le_add_right ih _)
  _ ≤ (n + 1) ^ 4 := by ring_nf; nlinarith