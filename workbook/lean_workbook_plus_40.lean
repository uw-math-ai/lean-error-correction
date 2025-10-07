theorem lean_workbook_plus_40 :
  ∀ θ : ℝ, 0 < θ ∧ θ < Real.pi / 4 → Real.cos θ > Real.sin θ   := by
  intro θ h₁
  rw [← cos_pi_div_two_sub, ← sin_pi_div_two_sub]
  rw [Real.sin_pi_div_two_sub]
  exact cos_lt_cos_of_nonneg_of_le_pi_div_two (by linarith) (by linarith) (by linarith)