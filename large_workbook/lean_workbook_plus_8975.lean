theorem lean_workbook_plus_8975 : 2015 ≡ -1 [ZMOD 3]   := by
  exact (show 2015 % 3 = -1 % 3 by norm_num)