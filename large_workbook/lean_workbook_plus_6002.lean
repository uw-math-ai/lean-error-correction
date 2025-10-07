theorem lean_workbook_plus_6002 : ∀ x y z : ℝ, x^2 + y^2 + z^2 = 1 → x + y + z ≤ Real.sqrt 3   := by
  refine' fun x y z h => le_sqrt_of_sq_le _
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]