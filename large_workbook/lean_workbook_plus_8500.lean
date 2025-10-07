theorem lean_workbook_plus_8500 (m n p : ℝ) (hm : 0 < m) (hn : 0 < n) (hp : 0 < p) : m * (m - n) * (m - p) + n * (n - m) * (n - p) + p * (p - m) * (p - n) ≥ 0   := by
  simp only [add_assoc, add_comm, add_left_comm]
  nlinarith [mul_nonneg hm.le (sq_nonneg (m - n)), mul_nonneg hn.le (sq_nonneg (n - m)),
  mul_nonneg hp.le (sq_nonneg (p - m)), mul_nonneg hm.le (sq_nonneg (m - p)),
  mul_nonneg hn.le (sq_nonneg (n - p)), mul_nonneg hp.le (sq_nonneg (p - n))]