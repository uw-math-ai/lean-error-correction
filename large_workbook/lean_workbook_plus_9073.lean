theorem lean_workbook_plus_9073 (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) : (1 / (1 + a) ^ 2 + 1 / (1 + b) ^ 2) ≥ 1 / (1 + a * b)   := by
  have h1 : 0 ≤ a * b := mul_nonneg ha hb
  field_simp [ha, hb, h1]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b - 1), sq_nonneg (a - b)]