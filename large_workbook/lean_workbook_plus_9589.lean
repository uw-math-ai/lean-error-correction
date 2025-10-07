theorem lean_workbook_plus_9589 (x y : ℝ) (hx : 0 ≤ x ∧ x ≤ 1) (hy : 0 ≤ y ∧ y ≤ 1) :
  (1 + x * y) ^ 2 ≥ (1 - x + x ^ 2) * (1 - y + y ^ 2)   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]