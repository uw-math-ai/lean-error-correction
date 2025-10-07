theorem lean_workbook_plus_2177 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : Real.sqrt ((1 + a) * (1 + b)) ≥ 1 + Real.sqrt (a * b)   := by
  have h1 : 0 ≤ (Real.sqrt a - Real.sqrt b)^2 := sq_nonneg (Real.sqrt a - Real.sqrt b)
  rw [sub_sq] at h1
  rw [Real.sq_sqrt (by positivity), Real.sq_sqrt (by positivity)] at h1
  apply le_sqrt_of_sq_le
  nlinarith [Real.sq_sqrt (mul_nonneg ha.le hb.le), Real.sq_sqrt (sq_nonneg (a - b))]