theorem lean_workbook_plus_8157 : ⌊(-15 : ℚ)/16⌋ = -1   := by
  exact Int.floor_eq_iff.mpr ⟨by norm_num, by norm_num⟩