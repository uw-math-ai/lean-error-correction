theorem lean_workbook_plus_6015 (x : ℕ) (hx : x = 84) : x^2 = 7056   := by
  simp only [hx, Nat.pow_succ, Nat.pow_zero, Nat.pow_one, Nat.mul_one, Nat.mul_zero, Nat.zero_add]