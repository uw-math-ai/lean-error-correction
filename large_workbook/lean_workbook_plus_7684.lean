theorem lean_workbook_plus_7684 : 2 ^ 40 ≡ 1 [ZMOD 31]   := by
  conv => lhs; rw [← pow_one 2]