theorem lean_workbook_plus_1255 (a b c : ℝ) (ha : a > 0) (hb : b > 0) (hc : c > 0) (hab : a + b + c = 3) : (1 / a ^ 2 + 1 / b ^ 2 + 1 / c ^ 2) ≥ (1 / (a * b) + 1 / (b * c) + 1 / (c * a))   := by
  field_simp [pow_two]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b * c), sq_nonneg (a * b - a * c), sq_nonneg (b * c - a * b),
  sq_nonneg (b * c - a * c), sq_nonneg (a * b - b * c), sq_nonneg (a * c - b * c)]