theorem lean_workbook_plus_7200 (y : ℝ) (hy : y > 0) : y^3 < y^3 + 2*y^2 + 1 ∧ y^3 + 2*y^2 + 1 < (y + 1)^3   := by
  constructor <;> nlinarith [sq_nonneg (y - 1), sq_nonneg (y + 1)]