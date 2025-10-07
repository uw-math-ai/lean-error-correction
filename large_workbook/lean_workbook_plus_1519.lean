theorem lean_workbook_plus_1519 (x : ℝ) (n : ℤ) : ⌊x + n⌋ = ⌊x⌋ + n   := by
  simp [Int.floor_eq_iff]