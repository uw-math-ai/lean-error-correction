theorem lean_workbook_plus_1939 (k : ℕ) : (3^(3^k - k) % 3) = 0   := by
  simp [Nat.pow_mod, Nat.mod_mod]
  simp [Nat.zero_pow (Nat.sub_pos_of_lt (Nat.lt_pow_self (by norm_num : 1 < 3) k))]