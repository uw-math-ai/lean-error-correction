theorem lean_workbook_plus_2406 (p : ℕ) (hp : p.Prime) (hp1 : p ≡ 1 [ZMOD 7]) : ∃ m : ℕ, ((7 : ℤ)∣(m^3 + m^2 - 2*m - 1) % p)   := by
  refine ⟨0,?_⟩
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
  simp only [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at hp1
  simp [Int.emod_eq_emod_iff_emod_sub_eq_zero] at hp1
  exact hp1