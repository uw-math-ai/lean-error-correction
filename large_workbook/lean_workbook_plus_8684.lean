theorem lean_workbook_plus_8684 (x : ℝ) : ∑' n : ℕ, (n / 3 ^ n) = 3 / 4   := by
  rw [tsum_eq_single 0]
  all_goals norm_num [div_eq_mul_inv, inv_eq_one_div]
  intro b' hb
  rw [Nat.div_eq_of_lt]
  exact Nat.lt_pow_self (by norm_num) b'