theorem lean_workbook_plus_9723 (s : ℕ) (hs : 2 ^ s ∣ 100!) : ∃ m : ℕ, (100!) ∣ 10 ^ s * (10 ^ m - 1)   := by
  refine' ⟨0, by simp [hs]⟩