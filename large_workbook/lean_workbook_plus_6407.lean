theorem lean_workbook_plus_6407 (b a : ℝ) (ha : a ≠ 0) : |1 + b / a| + 2 * |1 - b / a| ≥ 2   := by
  cases abs_cases (1 + b / a) <;> cases abs_cases (1 - b / a) <;> nlinarith