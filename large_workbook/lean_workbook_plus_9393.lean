theorem lean_workbook_plus_9393 (n d : ℕ) :
  ∑ i in Finset.Icc 1 d, choose (n + i - 1) n =
    ∑ i in Finset.Icc 1 d, (choose (n + i) (n + 1) - choose (n + i - 1) (n + 1))   := by
  refine' Finset.sum_congr rfl fun x hx => _
  rw [← Nat.succ_pred_eq_of_pos (Finset.mem_Icc.mp hx).1]
  simp [choose]