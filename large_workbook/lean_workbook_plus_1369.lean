theorem lean_workbook_plus_1369 {m n z x : ℝ}
 (hm : 0 < m)
 (hn : 0 < n)
 (hz : 0 < z)
 (hx : 0 < x) :
 (m * z + n * x) / (m + n) ≥ (m + n) / (m / z + n / x)   := by
  field_simp [hm, hn, hz, hx]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (m * x - m * z), sq_nonneg (n * z - n * x)]