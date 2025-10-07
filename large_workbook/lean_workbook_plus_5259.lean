theorem lean_workbook_plus_5259  (x y : ℝ) :
  (x - 2)^2 + 3 ≥ 3 ∧ (y + 1)^2 + 5 ≥ 5   := by
  refine' ⟨by nlinarith [sq_nonneg (x - 2)], by nlinarith [sq_nonneg (y + 1)]⟩