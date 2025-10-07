theorem lean_workbook_plus_5163 : ∀ x : ℝ, sin x * cos x ≤ 1 / 2   := by
  refine' fun x => _
  nlinarith [sq_nonneg (sin x - cos x), sin_sq_add_cos_sq x]