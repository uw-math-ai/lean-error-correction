theorem lean_workbook_plus_4582 (a b c d : ℝ) (ha : a ≥ 2) (hb : b ≥ 2) (hc : c ≥ 2) (hd : d ≥ 2) (habc : (a - 1) * (b - 1) * (c - 1) * (d - 1) = 1) : 1 / a + 1 / b + 1 / c + 1 / d ≥ 2   := by
  field_simp [ha, hb, hc, hd, habc]
  rw [le_div_iff (by positivity)]
  nlinarith [mul_nonneg (sub_nonneg.mpr ha) (sub_nonneg.mpr hb), mul_nonneg (sub_nonneg.mpr hc) (sub_nonneg.mpr hd), habc]