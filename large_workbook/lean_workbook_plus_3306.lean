theorem lean_workbook_plus_3306 : 5 ∣ 1^99 + 2^99 + 3^99 + 4^99 + 5^99   := by
  norm_num [Nat.dvd_add, Nat.dvd_add, Nat.dvd_add, Nat.dvd_add, Nat.dvd_add]