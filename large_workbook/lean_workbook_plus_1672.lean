theorem lean_workbook_plus_1672 (θ : ℝ) : Real.cos (Real.pi / 2 + θ) = - Real.sin θ   := by
  simp [cos_add, cos_pi_div_two, sin_pi_div_two]