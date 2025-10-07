theorem lean_workbook_plus_1867 (p : ℕ) (hp : p.Prime) (h : ∃ k : ℕ, (3 ^ (p - 1) - 1) / p = k ^ 2) : ∃ k : ℕ, (3 ^ (p - 1) - 1) / p = k ^ 2   := by
  exact h