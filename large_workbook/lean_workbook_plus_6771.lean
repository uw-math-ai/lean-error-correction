theorem lean_workbook_plus_6771 (n m : ℤ) (p : ℕ) (hp : p.Prime) (h : n = m * p) : (n + p^2) / p = m + p   := by
  rw [h, mul_comm]
  rw [Int.ediv_eq_of_eq_mul_left]
  exacts [Int.ofNat_ne_zero.mpr hp.ne_zero, by ring]