theorem lean_workbook_plus_2410  (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hab : a * b * c = 1) (h : a^2 + b^2 + c^2 = 1) :
  Real.sqrt ((ab + 2 * c^2) / (1 + ab - c^2)) + Real.sqrt ((bc + 2 * a^2) / (1 + bc - a^2)) + Real.sqrt ((ca + 2 * b^2) / (1 + ca - b^2)) ≥ 2 + ab + bc + ca   := by
  have h1 := sq_nonneg (a - b)
  nlinarith [Real.sqrt_nonneg ((ab + 2 * c^2) / (1 + ab - c^2)),
  Real.sqrt_nonneg ((bc + 2 * a^2) / (1 + bc - a^2)),
  Real.sqrt_nonneg ((ca + 2 * b^2) / (1 + ca - b^2))]