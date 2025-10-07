theorem lean_workbook_plus_7558 (n : ℤ) : 2 * n ≡ 0 [ZMOD 3] → n ≡ 0 [ZMOD 3]   := by
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
  omega