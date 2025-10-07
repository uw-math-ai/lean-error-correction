theorem lean_workbook_plus_1331 (n : ℕ) (hn : 1 ≤ n) : Real.cos (π / (n + 1)) > Real.cos (π / n)   := by
  obtain ⟨n, rfl⟩ : ∃ m, n = m + 1 := Nat.exists_eq_succ_of_ne_zero (zero_lt_one.trans_le hn).ne'
  apply Real.cos_lt_cos_of_nonneg_of_le_pi
  all_goals have := Real.pi_pos.le
  all_goals have := Real.pi_pos.le
  all_goals have := Real.pi_pos.le
  apply div_nonneg <;> linarith
  all_goals have := Real.pi_pos.le
  all_goals have := div_pos (pi_pos) (Nat.cast_add_one_pos (n + 1))
  all_goals field_simp [add_assoc, add_comm, add_left_comm]
  apply le_of_sub_nonneg
  all_goals have := Real.pi_pos.le
  all_goals field_simp [add_assoc, add_comm, add_left_comm]
  all_goals have := sq_nonneg (π - π * (n + 1) / (n + 1 + 1))
  all_goals have := sq_nonneg (π * (n + 1) - π)
  all_goals have := sq_nonneg (π * (n + 1) - π)
  all_goals have := sq_nonneg (π - π * (n + 1) / (n + 1 + 1))
  all_goals have := sq_nonneg (π - π * (n + 1) / (n + 1 + 1))
  all_goals have := sq_nonneg (π - π * (n + 1) / (n + 1 + 1))
  all_goals have := sq_nonneg (π * (n + 1) - π)
  apply div_nonneg <;> nlinarith [sq_nonneg (π * (n + 1) - π)]
  ring_nf at *
  apply mul_lt_mul_of_pos_left <;> norm_num [hn]
  all_goals norm_cast
  all_goals have h1 : 0 < 2 + n := by linarith
  all_goals have h2 : 0 < 1 + n := by linarith
  all_goals norm_num [hn, h1, h2]
  have h3 : 0 < 2 + n := by linarith
  field_simp [h1, h2, h3]
  all_goals have h4 : 0 < 2 + n := by linarith
  all_goals norm_cast
  all_goals have h5 : 0 < 1 + n := by linarith
  all_goals norm_num
  any_goals field_simp [h1.ne', h2.ne', h3.ne', h4.ne', h5.ne']
  any_goals positivity
  rw [div_lt_div_iff] <;> linarith