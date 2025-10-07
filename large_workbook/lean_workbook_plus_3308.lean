theorem lean_workbook_plus_3308 (x y z : ℝ) (h : x + y + z = 0) : x^3 + y^3 + z^3 - 3*x*y*z = 0   := by
  simp [add_assoc, add_comm, add_left_comm] at h ⊢
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]