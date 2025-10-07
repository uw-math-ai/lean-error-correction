theorem lean_workbook_plus_1866 (x y z : ℝ) :
  (x^2 * (x + y) * (x + z))^(1/3) + (y^2 * (y + z) * (y + x))^(1/3) + (z^2 * (z + x) * (z + y))^(1/3) ≥
  ((x + y + z)^4 + 9 * x * y * z * (x + y + z))^(1/3)   := by
  simp [add_comm, add_left_comm, add_assoc]