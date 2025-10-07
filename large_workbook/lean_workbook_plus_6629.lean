theorem lean_workbook_plus_6629 (x : ℕ) (hx : x = 9) : (x + 1)^10 = 10000000000   := by
  simp [hx, show (9 + 1) ^ 10 = 10000000000 by norm_num]