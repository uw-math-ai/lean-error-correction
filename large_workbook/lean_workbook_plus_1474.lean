theorem lean_workbook_plus_1474 (x y : ℝ) (hx : x ≠ 0) (hy : y ≠ 0) (hxy : x + y = 4 * x * y) : x⁻¹ + y⁻¹ = 4   := by
  field_simp [hx, hy, hxy]
  linarith [hx, hy, hxy]