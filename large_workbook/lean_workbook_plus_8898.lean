theorem lean_workbook_plus_8898 {a b c : ℝ} (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (2 - a) / (2 + a) + (2 - b) / (2 + b) + (2 - c) / (2 + c) ≥ 15 / 7 ↔ 4 / (2 + a) + 4 / (2 + b) + 4 / (2 + c) ≥ 36 / 7   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  rw [div_le_div_iff (by positivity) (by positivity)]
  constructor <;> intro h <;> linarith [ha, hb, hc, h]