theorem lean_workbook_plus_5353 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : 1 / a + 1 / b = 1) : 4 * a * b + 3 / (a + b) ≤ 35 / 4 + a ^ 2 + b ^ 2   := by
  field_simp [ha, hb] at hab ⊢
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (a - b), ha, hb, hab]