theorem lean_workbook_plus_9757 (x : ℝ) (f : ℝ → ℝ) (hf: f x = 2 * x) : f x = 2 * x   := by
  simp only [hf, eq_self_iff_true, and_self_iff]