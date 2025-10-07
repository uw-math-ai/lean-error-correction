theorem lean_workbook_plus_1375 (a b c : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) (hc : c ≥ 0) : a^2 + b^2 + c^2 + 2 * a * b * c + 1 ≥ a * b + b * c + c * a   := by
  simp [sq]
  nlinarith [mul_nonneg (mul_nonneg ha hb) hc, mul_nonneg ha (mul_nonneg hb hc)]