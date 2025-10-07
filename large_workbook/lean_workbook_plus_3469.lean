theorem lean_workbook_plus_3469 (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) : (3 * a + b) * (3 * b + a) ≥ 2 * (a + b) * (Real.sqrt a + Real.sqrt b) ^ 2   := by
  have h1 : 0 ≤ (Real.sqrt a - Real.sqrt b)^2 := sq_nonneg (Real.sqrt a - Real.sqrt b)
  nlinarith [Real.sq_sqrt ha, Real.sq_sqrt hb]