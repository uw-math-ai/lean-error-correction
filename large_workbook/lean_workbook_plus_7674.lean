theorem lean_workbook_plus_7674 (n : ℕ) : 10 ^ 4 - 1 ∣ 10 ^ (4 * n) - 1   := by
  simpa only [one_pow, pow_mul] using nat_sub_dvd_pow_sub_pow _ 1 n