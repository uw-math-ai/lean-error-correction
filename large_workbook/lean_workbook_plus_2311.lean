theorem lean_workbook_plus_2311 : ∀ n ≥ 3, Real.sqrt (2 * n) ≥ Real.sqrt (n + Real.sqrt (2 * n + 1))   := by
  refine' fun n hn => Real.sqrt_le_sqrt _
  nlinarith [Real.sq_sqrt (by positivity : 0 ≤ 2 * n + 1)]