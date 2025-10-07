theorem lean_workbook_plus_346 (n k m : ℕ) (h₁ : k ≤ n) (h₂ : m ≤ k) : choose n k * choose k m = choose n m * choose (n - m) (k - m)   := by
  simp [choose_mul, h₁, h₂, sub_eq_iff_eq_add]