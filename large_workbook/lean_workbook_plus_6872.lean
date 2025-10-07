theorem lean_workbook_plus_6872 (k : ℕ) (h₁ : 1 < k) : 3 ^ (k - 1) > k   := by
  induction' h₁ with k h₁ h₂
  simp [Nat.succ_eq_add_one]
  rw [Nat.succ_eq_add_one, Nat.add_sub_cancel]
  cases k <;> simp_all [Nat.pow_succ]
  nlinarith [pow_pos (by norm_num : 0 < 3) (k - 1)]