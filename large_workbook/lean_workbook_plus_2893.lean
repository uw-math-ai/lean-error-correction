theorem lean_workbook_plus_2893 (x : ℝ) (hx : 0 ≤ x ∧ x < 1) :
  ∑' n : ℕ, x ^ n = 1 / (1 - x)   := by
  simp [tsum_geometric_of_lt_1 hx.1 hx.2, hx.2.ne]