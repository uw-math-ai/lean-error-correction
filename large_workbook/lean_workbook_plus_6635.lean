theorem lean_workbook_plus_6635 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (1 / (1 + a) + 1 / (1 + b) + 1 / (1 + c) = 1 → a + b + c + 2 = a * b * c)   := by
  field_simp [ha, hb, hc]
  refine' fun h => by linarith [h]