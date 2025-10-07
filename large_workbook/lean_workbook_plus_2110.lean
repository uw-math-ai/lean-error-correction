theorem lean_workbook_plus_2110 (α β γ : ℝ) (h : α + β + γ ≥ 6) (habc : α * β * γ = α + β + γ + 2) : α * β * γ ≥ 8   := by
  nlinarith [sq_nonneg (α - 1), sq_nonneg (β - 1), sq_nonneg (γ - 1)]