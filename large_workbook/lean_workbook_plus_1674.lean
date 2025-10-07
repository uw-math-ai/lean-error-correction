theorem lean_workbook_plus_1674 (k : ℕ) : ∃ a : ℕ, (2 * k + 2)! / ((2 : ℕ) ^ (k + 1) * (k + 1)!) = a   := by
  refine' ⟨(2 * k + 2)! / (2 ^ (k + 1) * (k + 1)!), by simp⟩