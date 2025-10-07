theorem lean_workbook_plus_4637 :
  -(1 / 2) * (Real.cos 1 - Real.cos 0) = (1 - Real.cos 1) / 2   := by
  field_simp [cos_zero]