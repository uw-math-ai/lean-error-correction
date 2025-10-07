theorem lean_workbook_plus_739 (f : ℝ → ℝ) (hf : f = λ x => x^4 + ax^3 + bx^2 + cx + d) : f (-1) = -1 ∧ f 2 = -4 ∧ f (-3) = -9 ∧ f 4 = -16 → f 1 = -1   := by
  simp [hf] at *
  simp_all [pow_succ]