theorem lean_workbook_plus_7233 : ∀ x : ℝ, x ∈ Set.Ioo 0 1 → x * (1 - x) * (x ^ 4 * (x ^ 2 + x + 1) + 1) < 1   := by
  rintro x ⟨hx1, hx2⟩
  nlinarith [sq_nonneg (x - 1), sq_nonneg (x ^ 2 - 1), sq_nonneg (x ^ 3 - 1)]