theorem lean_workbook_plus_1011 (a : ℕ → ℝ) (c x : ℝ) (hc : 0 < c) (hx : |x| < c) : ∃ y : ℝ, y = ∑' k : ℕ, a k * x ^ k   := by
  refine' ⟨∑' k : ℕ, a k * x ^ k, by simp⟩