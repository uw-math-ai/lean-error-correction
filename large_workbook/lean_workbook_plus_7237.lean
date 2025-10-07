theorem lean_workbook_plus_7237 : 2^6 ≡ -1 [ZMOD 13]   := by
  conv => lhs; rw [← pow_one 2]