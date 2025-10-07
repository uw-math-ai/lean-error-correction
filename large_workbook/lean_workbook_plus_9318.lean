theorem lean_workbook_plus_9318 : Real.cos (π / 2) + Real.cos (3 * π / 2) = 0 + 0   := by
  rw [show (3 : ℝ) * π / 2 = π + π / 2 by ring, cos_add]
  norm_num [cos_pi, sin_pi]