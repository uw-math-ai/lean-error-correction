theorem lean_workbook_plus_4590 : 2 * Real.cos (Real.pi / 4) = Real.sqrt 2   := by
  field_simp [cos_pi_div_four]
  ring