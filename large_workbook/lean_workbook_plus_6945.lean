theorem lean_workbook_plus_6945 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) (h : (1 / (a^2 + 1)) + (1 / (b^2 + 1)) + (1 / (c^2 + 1)) = 2) : a * b * c * (a + b + c - 2 * a * b * c) ≤ 1 / 2   := by
  field_simp [ha.ne', hb.ne', hc.ne', habc] at h ⊢
  nlinarith [ha, hb, hc, habc, h]