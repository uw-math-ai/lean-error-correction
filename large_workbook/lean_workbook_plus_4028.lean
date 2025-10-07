theorem lean_workbook_plus_4028 : 10^(Nat.totient 729) ≡ 1 [ZMOD 729]   := by
  conv => lhs; rw [← pow_one 10]