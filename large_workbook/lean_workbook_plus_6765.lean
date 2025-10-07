theorem lean_workbook_plus_6765 (u : ℕ → ℕ) (k : ℕ) (h₁ : u = fun (k : ℕ) => 3 * 5^(2 * k + 1) + 2^(3 * k + 1)) : u k = 3 * 5^(2 * k + 1) + 2^(3 * k + 1)   := by
  simp [h₁]