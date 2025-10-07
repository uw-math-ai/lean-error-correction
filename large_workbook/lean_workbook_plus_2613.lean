theorem lean_workbook_plus_2613 (x : ℕ → ℝ) (x0 : ℝ) (h : ∀ n, x n = x0) : ∃ l, ∀ ε > 0, ∃ N, ∀ n ≥ N, |x n - l| < ε   := by
  refine' ⟨x0, fun ε ε0 => ⟨0, fun n _ => by simp [h, ε0]⟩⟩