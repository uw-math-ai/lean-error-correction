theorem lean_workbook_plus_4816 {a b : ℤ} (h : a % 8 = b % 8) : a^2 % 8 = b^2 % 8   := by
  simp [sq, Int.mul_emod, h]