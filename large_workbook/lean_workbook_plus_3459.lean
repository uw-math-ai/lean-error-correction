theorem lean_workbook_plus_3459 (x : ℕ → ℝ) (h : ∑ i in Finset.range 101, x i = 0) :
    ∃ c : ℝ, c * ∑ i in Finset.range 101, (x i) ^ 3 ≥ (∑ i in Finset.range 101, x i) ^ 2   := by
  refine' ⟨0, by simp [h]⟩