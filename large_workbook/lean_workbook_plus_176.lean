theorem lean_workbook_plus_176 (s : ℝ) (hs : 9 / 4 ≤ s ∧ s ≤ 3) : 4 * s ^ 2 - 21 * s + 27 ≤ 0   := by
  nlinarith [hs.1, hs.2]