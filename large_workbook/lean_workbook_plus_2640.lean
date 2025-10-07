theorem lean_workbook_plus_2640 (a b c : ℝ) (ha : a > 0 ∧ b > 0 ∧ c > 0 ∧ a * b * c = 1): a^3 + b^3 + c^3 >= a * b + b * c + a * c   := by
  have h1 : 0 ≤ (a - b)^2 + (b - c)^2 + (c - a)^2 := by nlinarith
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1), sq_nonneg (c - 1)]