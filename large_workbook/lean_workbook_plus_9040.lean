theorem lean_workbook_plus_9040 (x : ℕ) : 9 * (5^5) = 28125   := by
  norm_num [show (9 : ℕ) * 5 ^ 5 = 28125 by norm_num]