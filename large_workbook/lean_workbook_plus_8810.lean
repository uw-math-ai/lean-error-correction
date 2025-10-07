theorem lean_workbook_plus_8810 (x : ℝ) (hx : 0 ≤ x ∧ x ≤ π/2) :
  Real.sqrt (x * Real.cos x) ≤ (x + Real.cos x) / 2   := by
  have h₁ : 0 ≤ cos x := Real.cos_nonneg_of_mem_Icc ⟨by linarith [hx.1], by linarith [hx.2]⟩
  have h₂ := sq_nonneg (x - cos x)
  rw [Real.sqrt_le_left] <;> nlinarith