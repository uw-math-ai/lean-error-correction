theorem lean_workbook_plus_5951 :
  (Real.log (Real.sqrt 3 + 1) - Real.log 2) = Real.log ((Real.sqrt 3 + 1) / 2)   := by
  field_simp [Real.log_div]