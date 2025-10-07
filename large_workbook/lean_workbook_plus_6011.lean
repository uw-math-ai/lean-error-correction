theorem lean_workbook_plus_6011 : ∀ α β : ℝ, exp (i * (α + β)) = exp (i * α) * exp (i * β)   := by
  exact fun α β ↦ by rw [mul_add, exp_add]