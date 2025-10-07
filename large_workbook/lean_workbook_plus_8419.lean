theorem lean_workbook_plus_8419 : n ≡ 4 [ZMOD 8] → ¬ n ≡ 3 [ZMOD 4]   := by
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
  omega