theorem lean_workbook_plus_6511 (p : ℕ) (hp : p.Prime) (h : (-5 : ZMod p) = 1 ∨ (-5 : ZMod p) = 2) : ∃ a b : ℤ, (a^2 + 5 * b^2) % p = 1 ∨ (a^2 + 5 * b^2) % p = 2   := by
  refine' ⟨1, 0, Or.inl _⟩
  simp [hp, h]
  norm_cast
  simp only [Nat.mod_eq_of_lt hp.one_lt]