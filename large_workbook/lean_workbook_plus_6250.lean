theorem lean_workbook_plus_6250 : (1 + 1 / 1000) ^ 1000 < 3 ∧ 3 < 1001   := by
  refine' ⟨by norm_num [pow_one], by norm_num [pow_one]⟩