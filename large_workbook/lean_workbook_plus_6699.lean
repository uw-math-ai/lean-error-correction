theorem lean_workbook_plus_6699 (a b c : ℝ) :
  9 - 3 * (Real.cos a ^ 2 + Real.cos b ^ 2 + Real.cos c ^ 2) ≤ 9 - (Real.cos a + Real.cos b + Real.cos c) ^ 2   := by
  nlinarith [sq_nonneg (cos a - cos b), sq_nonneg (cos b - cos c), sq_nonneg (cos c - cos a)]