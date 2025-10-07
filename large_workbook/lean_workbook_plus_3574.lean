theorem lean_workbook_plus_3574 (n : ℕ) : ∑ i in Finset.range (n+1), i = (n + 1).choose 2   := by
  simp [Finset.sum_range_id, Nat.choose_two_right]