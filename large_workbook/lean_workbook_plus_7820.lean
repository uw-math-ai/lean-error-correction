theorem lean_workbook_plus_7820  (a b c : ℝ)
  (h₀ : 1 ≤ a ∧ 1 ≤ b ∧ 1 ≤ c) :
  a^3 + b^3 + c^3 ≥ a^2 + b^2 + c^2   := by
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1), sq_nonneg (c - 1)]