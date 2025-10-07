theorem lean_workbook_plus_5073 (n : ℕ) : ∃ a : ℕ → ℕ, ∀ k, 1 ≤ k ∧ k ≤ n → (∑ i in Finset.Icc 1 n, (1/(i * a i)) = n/(n+1))   := by
  refine' ⟨fun _ => 0, fun k hk => _⟩
  simp [hk.1, hk.2, Nat.div_eq_of_lt]