theorem lean_workbook_plus_9909  (n : ℕ)
  (h₀ : 0 < n) :
  1 ≤ φ n   := by
  exact Nat.one_le_of_lt (totient_pos h₀)