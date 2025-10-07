theorem lean_workbook_plus_7449 (n : ℕ) (hn : n > 0) (h : n % 2 = 1) : (∑ i in Finset.range n, i) ∣ (∏ i in Finset.range n, i)   := by
  rw [← Nat.mod_add_div n 2]
  simp [Finset.sum_range_succ, Finset.prod_range_succ, h]
  simp [Finset.sum_range_succ, Finset.prod_range_succ, Nat.dvd_iff_mod_eq_zero]
  simp [Finset.prod_range_add, Finset.sum_range_add, h]