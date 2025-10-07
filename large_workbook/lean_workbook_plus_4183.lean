theorem lean_workbook_plus_4183 :
  Real.log 2 / Real.log 6 + Real.log 3 / Real.log 6 = 1   := by
  field_simp
  rw [← Real.log_mul] <;> norm_num [Real.log_pos_iff]