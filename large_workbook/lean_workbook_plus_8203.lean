theorem lean_workbook_plus_8203 (P : ℕ → ℕ) (hP: P = fun n => 7 ^ n % 10) : ∑ n in Finset.Icc 1 3981, P n = 19907   := by
  conv_lhs => rw [hP]