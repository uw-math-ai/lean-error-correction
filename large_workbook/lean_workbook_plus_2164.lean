theorem lean_workbook_plus_2164 (p : ℕ) (hp : p.Prime) (hp2 : p ≠ 2) : ∃ n : ℕ, p ∣ 2 ^ n - 1   := by
  refine' ⟨0, by simp⟩