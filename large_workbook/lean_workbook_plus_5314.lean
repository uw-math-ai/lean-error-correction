theorem lean_workbook_plus_5314 (k m : ℕ) (hm : Odd m) : ∃ n : ℕ, 2 ^ k ∣ n ^ n - m   := by
  obtain ⟨n, rfl⟩ := hm
  refine' ⟨0, by simp⟩