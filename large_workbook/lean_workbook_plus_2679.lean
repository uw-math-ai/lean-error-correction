theorem lean_workbook_plus_2679 : ∑' n : ℕ, (1 / (n + 1)! ) < 3   := by
  rw [tsum_eq_single 0]
  all_goals aesop
  simp [Nat.factorial] at a ⊢
  rw [Nat.div_eq_of_lt]
  obtain ⟨b, rfl⟩ := Nat.exists_eq_succ_of_ne_zero a
  nlinarith [Nat.factorial_pos (succ b)]