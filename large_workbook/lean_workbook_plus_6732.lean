theorem lean_workbook_plus_6732 (f : ℝ → ℝ) (f_def : ∀ x, x < 5 → f x = 3 * x + 6 ∧ ∀ x, 5 ≤ x → f x = 7 * x - 20) : f (f (f 2)) = 428   := by
  norm_num [f_def 2, f_def 6, f_def 14]