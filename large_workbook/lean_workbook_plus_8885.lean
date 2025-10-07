theorem lean_workbook_plus_8885 (n : ℕ) : (x - 1) ^ n ∣ ∏ k in Finset.range (n + 1), (x ^ (2 ^ k) - 1)   := by
  induction' n with n ih
  simp [Finset.prod_range_succ, Finset.prod_range_zero]
  rw [Finset.prod_range_succ, pow_succ]
  refine' mul_dvd_mul ih _
  simpa using nat_sub_dvd_pow_sub_pow _ 1 (2 ^ (n + 1))