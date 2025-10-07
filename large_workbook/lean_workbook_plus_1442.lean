theorem lean_workbook_plus_1442 (m n : ℝ) (hm : 1 ≤ m) (hn : 1 ≤ n) (hmn : 1 ≤ m * n) : 1 / m ^ 2 + 1 / n ^ 2 ≥ 16 / (1 + 8 * m * n)   := by
  field_simp [hm, hn, hmn]
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (m - n), hm, hn, hmn]