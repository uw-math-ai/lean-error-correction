theorem lean_workbook_plus_9284 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) : a * Real.sqrt a + b * Real.sqrt b + c * Real.sqrt c >= 3 → a * b * c + 2 >= 9 / (a ^ 3 + b ^ 3 + c ^ 3)   := by
  field_simp [ha, hb, hc, habc]
  intro h
  rw [div_le_iff] <;> nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]