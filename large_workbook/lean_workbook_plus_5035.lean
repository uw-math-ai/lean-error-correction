theorem lean_workbook_plus_5035 (n k : ℕ) (h₁ : k ≤ n) : choose n k = choose n (n - k)   := by
  rw [← choose_symm_of_eq_add]
  rw [Nat.sub_add_cancel h₁]