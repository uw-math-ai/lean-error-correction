theorem lean_workbook_plus_7627 (f : ℝ → ℝ) : (f (3 * x))^4 = f (3 * x)^4   := by
  simp only [eq_self_iff_true, heq_iff_eq, true_and_iff]