theorem lean_workbook_plus_7170 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (3 / (1 / (a + 1) + 1 / (b + 1) + 1 / (c + 1))) ≥ 1 + (3 / (1 / a + 1 / b + 1 / c)) ↔ (1 / (1 / (a + 1) + 1 / (b + 1) + 1 / (c + 1))) - (1 / (1 / a + 1 / b + 1 / c)) ≥ 1 / 3   := by
  ring_nf
  constructor <;> intro h <;> linarith