theorem lean_workbook_plus_4057 (a b c : ℝ) (ha : 1 ≤ a) (hb : 1 ≤ b) (hc : 1 ≤ c) : (a / (2 * a + 1) + b / (2 * b + 1) + c / (2 * c + 1)) ≥ 1   := by
  field_simp [ha, hb, hc]
  rw [← sub_nonneg]
  field_simp [ha, hb, hc]
  apply div_nonneg <;> nlinarith [mul_nonneg (sub_nonneg.2 ha) (sub_nonneg.2 hb), sub_nonneg.2 hc]