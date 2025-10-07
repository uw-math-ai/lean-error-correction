theorem lean_workbook_plus_1680 (a r : ℝ) (h : |r| < 1) : ∑' i : ℕ, a * r ^ i = a / (1 - r)   := by
  field_simp [tsum_mul_left, tsum_geometric_of_abs_lt_1 h]