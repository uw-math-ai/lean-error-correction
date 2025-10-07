theorem lean_workbook_plus_4292 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (1 / a + 1 / b + 1 / c) ≥ (2 / (a + b) + 2 / (b + c) + 2 / (c + a)) ∧ (2 / (a + b) + 2 / (b + c) + 2 / (c + a)) ≥ 9 / (a + b + c)   := by
  constructor <;> field_simp [ha, hb, hc] <;> ring
  all_goals field_simp [ha, hb, hc]
  all_goals rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b - b * c), sq_nonneg (b * c - c * a), sq_nonneg (c * a - a * b)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]