theorem lean_workbook_plus_3883 (n : ℕ) : ∃ F : ℕ → ℕ, ∀ k : ℕ, k ≤ n - 1 → F (k + 1) - F k ≥ 3   := by
  exact ⟨fun k => 3 * k, by simp [Nat.mul_succ]⟩