theorem lean_workbook_plus_301 (a b c : ℝ) : (a^2 + 5 * b^2) / c^2 ≥ (5:ℝ) / 24 * (3 * (5:ℝ)^(1 / 3) - 21 * (25:ℝ)^(1 / 3) - 1)   := by
  ring_nf
  nlinarith [sq_nonneg (a * c⁻¹ - b * c⁻¹), sq_nonneg (a * c⁻¹ + b * c⁻¹)]