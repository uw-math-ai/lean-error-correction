theorem lean_workbook_plus_5288 {n : ℕ} (a : ℕ → ℕ) (h : ∀ k, 1 ≤ k ∧ k ≤ n → a k = k) : (∀ k, 1 ≤ k ∧ k ≤ n + 1 → a k = k) ↔ a (n + 1) = n + 1   := by
  refine' ⟨fun h1 => _, fun h1 k hk => _⟩ <;> aesop
  cases' eq_or_lt_of_le right with h2 h2
  exacts [h2 ▸ h1, h k left (Nat.lt_succ_iff.mp h2)]