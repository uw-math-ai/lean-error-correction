theorem lean_workbook_plus_1466 : ∀ m : ℕ, Odd m → 5 ^ m + 6 ^ m ≡ 0 [ZMOD 11] → 5 ^ m ≡ -6 ^ m [ZMOD 11]   := by
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]