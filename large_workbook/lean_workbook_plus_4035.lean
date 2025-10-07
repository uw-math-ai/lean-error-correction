theorem lean_workbook_plus_4035 {x y z : ℝ} (h : x + y + z = 0) :
  4 * (1 + x ^ 2) * (1 + y ^ 2) * (1 + z ^ 2) ≥ (2 + x ^ 2 + y ^ 2 + z ^ 2) ^ 2   := by
  have h1 : x = -(y + z) := by linarith
  subst h1
  nlinarith [sq_nonneg (y * z)]