theorem lean_workbook_plus_608 : ∀ k n : ℕ, k^n = (k - 1)^n + (k^n - (k - 1)^n) * 1^n   := by
  simp [add_comm, add_left_comm, add_assoc]
  intros k n
  simp [add_tsub_cancel_of_le (Nat.pow_le_pow_of_le_left (Nat.sub_le ..) ..)]