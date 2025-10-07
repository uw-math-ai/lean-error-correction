theorem lean_workbook_plus_8672 (f g : ℕ → ℝ) (N : ℕ) : ∑ n in Finset.Icc 1 N, f n * g n
  = f (N + 1) * (∑ n in Finset.Icc 1 N, g n) -
    ∑ n in Finset.Icc 1 N, ((∑ k in Finset.Icc 1 n, g k) * (f (n + 1) - f n))   := by
  induction' N with N ih
  simp [Finset.sum_range_succ, Finset.sum_range_zero]
  simp [Finset.Icc, Finset.sum_range_succ] at ih ⊢
  simp [LocallyFiniteOrder.finsetIcc, Nat.succ_eq_add_one]
  simp [ih, add_comm, add_left_comm, add_assoc]
  simp [LocallyFiniteOrder.finsetIcc] at ih ⊢
  simp [List.range'_concat, ih, add_comm, add_left_comm, add_assoc]
  ring