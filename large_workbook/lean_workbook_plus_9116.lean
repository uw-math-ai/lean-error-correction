theorem lean_workbook_plus_9116 :
  ∀ x y z : ℝ, 6 * (x + y + z) ^ 2 ≥ 5 * (x ^ 2 + y ^ 2 + z ^ 2) + 13 * (x * y + y * z + z * x)   := by
  exact fun x y z ↦ by linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]