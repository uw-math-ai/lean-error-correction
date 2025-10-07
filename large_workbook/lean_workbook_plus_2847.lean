theorem lean_workbook_plus_2847 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : (a + 2 * b + 2 / (a + 1)) * (b + 2 * a + 2 / (b + 1)) = 16) : a * b ≤ 1   := by
  field_simp [ha.ne', hb.ne'] at hab ⊢
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1)]