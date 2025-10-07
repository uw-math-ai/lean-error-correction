theorem lean_workbook_plus_5069 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : (a + 2 * b + 2 / (a + 1)) * (b + 2 * a + 2 / (b + 1)) = 9) : a * b ≤ 1 / 3   := by
  field_simp [ha.ne', hb.ne'] at hab ⊢
  have h1 : 0 ≤ (a - b)^2 := sq_nonneg (a - b)
  nlinarith [ha, hb, hab, h1]