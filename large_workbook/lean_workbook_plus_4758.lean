theorem lean_workbook_plus_4758 : ∀ x : ℝ, 1 ≤ x → 2 / (x * (1 + exp (-x))) ≥ 1 / x   := by
  intro x hx
  rw [ge_iff_le]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [exp_le_one_iff.2 (by linarith : -x ≤ 0)]