theorem lean_workbook_plus_6326 (x : ℕ) (hx : ∃ k, k^2 = x) : ∃ k, k^2 = 4*x ∧ ∃ k, k^2 = 9*x   := by
  obtain ⟨k, hk⟩ := hx
  refine' ⟨2 * k, _, 3 * k, _⟩ <;> ring_nf at hk ⊢ <;> rw [hk] <;> ring