theorem lean_workbook_plus_5167 : 12 ≡ 5 [ZMOD 7]   := by
  exact (show 12 % 7 = 5 % 7 by norm_num)