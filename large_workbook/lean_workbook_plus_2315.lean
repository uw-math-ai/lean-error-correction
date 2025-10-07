theorem lean_workbook_plus_2315 (x : ℕ → ℝ) (hx : CauchySeq x) :
    ∃ n : ℕ → ℕ, ∀ k : ℕ, ‖x (n (k + 1)) - x (n k)‖ ≤ (1 / 2)^k   := by
  refine' ⟨0, fun k => _⟩
  simp [hx.1, hx.2]