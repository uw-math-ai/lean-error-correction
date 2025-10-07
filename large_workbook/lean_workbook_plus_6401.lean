theorem lean_workbook_plus_6401 (x : ℝ) (a : ℝ) (hx : abs x ≥ 1) (h : x^5 - x^3 + x - 1 = a) :
x^6 - 1 ≥ 2 * a   := by
  nlinarith [sq_nonneg (x^3 - 1), sq_nonneg (x^2 - 1), sq_nonneg (x - 1)]