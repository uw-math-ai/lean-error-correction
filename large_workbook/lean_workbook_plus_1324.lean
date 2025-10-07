theorem lean_workbook_plus_1324 (ε : ℝ) (a : ℕ → ℝ) (N : ℕ) (hN : N > 1 + Real.log (1/ε)) (ha : ∀ n ≥ N, |a n - Real.sqrt 2| ≤ ε) : ∀ n ≥ N, |a n - Real.sqrt 2| ≤ ε   := by
  exact fun n hn ↦ ha n hn