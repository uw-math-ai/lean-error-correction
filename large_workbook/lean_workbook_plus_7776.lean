theorem lean_workbook_plus_7776 : ¬ ∃ x : ℝ, x^6 + x^5 + x^4 - x^3 - x^2 + 1 = 0   := by
  rintro ⟨x, hx⟩
  nlinarith [sq_nonneg (x ^ 3), sq_nonneg (x ^ 2 - 1)]