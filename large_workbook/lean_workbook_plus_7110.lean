theorem lean_workbook_plus_7110 {m n x y : ℝ} (hm : 0 < m) (hn : 0 < n) (hx : 0 < x) (hy : 0 < y) :
  (m * x + n * y) / (m + n) ≥ (m + n) / (m / x + n / y)   := by
  field_simp [add_comm]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (m * x - m * y), sq_nonneg (m * y - n * x), sq_nonneg (n * x - n * y)]