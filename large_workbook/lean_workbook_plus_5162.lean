theorem lean_workbook_plus_5162  (n : ℕ) :
  ∑ k in (Finset.range (n + 1)), k = n * (n + 1) / 2   := by
  simp [Finset.sum_range_id]
  simp [Nat.mul_comm, Nat.mul_assoc, Nat.mul_left_comm]