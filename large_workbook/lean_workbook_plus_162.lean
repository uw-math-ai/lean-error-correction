theorem lean_workbook_plus_162  (a b c : ℝ) :
  Real.cos (a + b) * Real.sin b - Real.cos (a + c) * Real.sin c
    = Real.sin (a + b) * Real.cos b - Real.sin (a + c) * Real.cos c   := by
  simp [cos_add, sin_add, cos_sub, sin_sub]
  ring
  simp [cos_sq', sin_sq_add_cos_sq]
  ring