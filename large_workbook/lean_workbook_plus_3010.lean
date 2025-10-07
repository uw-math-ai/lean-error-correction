theorem lean_workbook_plus_3010 : ∀ a b c : ℝ, a + b + c = 3 → Real.sqrt 3 ≤ Real.sqrt (a ^ 2 + b ^ 2 + c ^ 2)   := by
  intro a b c h
  apply Real.sqrt_le_sqrt
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1), sq_nonneg (c - 1)]