theorem lean_workbook_plus_3071 (a b : ℝ) : a = 2 ∧ b = 2 → (a^3*b^3+1)/(a^3+b^3) = 65/16   := by
  refine' fun h => h.1.symm ▸ h.2.symm ▸ by norm_num