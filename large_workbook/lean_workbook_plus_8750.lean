theorem lean_workbook_plus_8750 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : a + b = 1 → a * b ≤ 1 / 4   := by
  exact fun h ↦ by nlinarith [sq_nonneg (a - 1/2), sq_nonneg (b - 1/2)]