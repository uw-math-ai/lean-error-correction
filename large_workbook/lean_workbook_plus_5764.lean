theorem lean_workbook_plus_5764 : ∀ n : ℕ, (∃ p : ℕ, p.Prime ∧ p ≠ 3 ∧ n = p * ℓ → ¬Nat.Prime (1 + 2^n + 4^n))   := by
  intro n
  refine' ⟨3, by norm_num⟩