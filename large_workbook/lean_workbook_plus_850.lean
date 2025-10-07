theorem lean_workbook_plus_850  (a n : ℕ)
  (h₀ : Odd a)
  : Even (a^(2^n) - 1)   := by
  obtain ⟨b, rfl⟩ := h₀
  rw [← Nat.mod_add_div ((2 * b + 1) ^ 2 ^ n) 2]
  simp [Nat.pow_mod, Nat.add_mod, Nat.mul_mod, Nat.mod_mod]