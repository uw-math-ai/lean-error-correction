theorem lean_workbook_plus_3450 (a b c d : ℝ) (h1 : a ^ 2 + b ^ 2 = 1) (h2 : c ^ 2 + d ^ 2 = 1) : |a * c - b * d| ≤ 1   := by
  have h3 : 0 ≤ (a * d + b * c) ^ 2 := sq_nonneg _
  exact (abs_sub_le_iff.2 ⟨by nlinarith [h1, h2, h3], by nlinarith [h1, h2, h3]⟩)