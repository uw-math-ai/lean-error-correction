theorem lean_workbook_plus_2614 (p q α β θ : ℝ) (hp : cos (θ - α) = p) (hq : sin (θ + β) = q) : p^2 + q^2 - 2 * p * q * sin (α + β) = cos (α + β)^2   := by
  simp [hp.symm, hq.symm, cos_add, cos_sub, sin_add, sin_sub]
  nlinarith [cos_sq_add_sin_sq θ, cos_sq_add_sin_sq α, cos_sq_add_sin_sq β]