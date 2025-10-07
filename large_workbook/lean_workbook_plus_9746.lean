theorem lean_workbook_plus_9746 (n:ℕ) : ∑ k in Finset.range (n+1), (3^k* Nat.choose n k) = 4^n   := by
  have := (add_pow 3 1 n).symm
  simpa [add_comm] using this