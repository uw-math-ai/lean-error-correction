theorem lean_workbook_plus_4467 (x y z r R : ℝ) (hx : x > 0 ∧ y > 0 ∧ z > 0) (hab : x + y + z = 1) (hbc : x + y = 2 * r) (hR : R = 2 * r * sin (π / 2)) : 2 * r ≤ R ↔ 8 * x * y * z ≤ (x + y) * (y + z) * (z + x)   := by
  rw [hR]
  field_simp [hx.1, hx.2.1, hx.2.2]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]