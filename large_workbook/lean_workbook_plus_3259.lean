theorem lean_workbook_plus_3259 (x : ℕ) (hx : x = ∑ e in Finset.Icc 1 5050, e) : x = 12753775   := by
  conv_lhs => rw [hx]