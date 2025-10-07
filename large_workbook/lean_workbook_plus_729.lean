theorem lean_workbook_plus_729  (n : ℕ) :
  2 * Real.sqrt n + 1 / Real.sqrt (n + 1) ≤ 2 * Real.sqrt (n + 1)   := by
  have h1 : 0 ≤ (Real.sqrt (n : ℝ) - Real.sqrt (n + 1))^2 := sq_nonneg _
  ring_nf at h1 ⊢
  have h2 := sq_nonneg (Real.sqrt n - Real.sqrt (1 + n))
  have h3 := Real.sq_sqrt (Nat.cast_nonneg n)
  have h4 : √(1 + n) ^ 2 = 1 + n := Real.sq_sqrt (by linarith)
  have h5 := Real.sqrt_nonneg (n : ℝ)
  have h6 : 0 ≤ √(1 + n) := Real.sqrt_nonneg (1 + n)
  have h7 := Real.sqrt_nonneg (1 + n)
  have h8 := Real.sqrt_nonneg (1 + n)
  have h9 := Real.sqrt_nonneg (1 + n)
  field_simp at h1 h2 h3 h4 h5 h6 h7 h8 h9 ⊢
  ring_nf at h1 h3 h4 ⊢
  field_simp [h5, h6, h7, h8, h9]
  rw [div_le_iff (by positivity)]
  ring_nf at h1 ⊢
  field_simp [h5, h6, h7, h8, h9] at h1 ⊢
  nlinarith [h5, h6, h7, h8, h9, h1]