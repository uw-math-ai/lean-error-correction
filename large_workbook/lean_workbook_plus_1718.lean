theorem lean_workbook_plus_1718 (r m o : ℝ) : (r + m + o) ^ 2 ≥ 3 * (r * m + m * o + o * r)   := by
  nlinarith [sq_nonneg (r - m), sq_nonneg (m - o), sq_nonneg (o - r)]