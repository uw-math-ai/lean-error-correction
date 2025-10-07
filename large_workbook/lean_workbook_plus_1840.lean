theorem lean_workbook_plus_1840 :
  1547 % 13 = 0   := by
  simp only [Nat.mod_eq_zero_of_dvd (by norm_num : 13 ∣ 1547)]