theorem lean_workbook_plus_1550 (x : ℝ) :  x ^ 2 * Real.sin x + x * Real.cos x + x ^ 2 + 1 / 2 > 0   := by
  have h : 0 ≤ (x * sin x + cos x) ^ 2 := sq_nonneg _
  have h1 := sq_nonneg (x * cos x - sin x)
  field_simp [sin_sq, cos_sq] at h h1 ⊢
  have h2 := sq_nonneg (x ^ 2 - 1)
  nlinarith [sin_sq_add_cos_sq x]