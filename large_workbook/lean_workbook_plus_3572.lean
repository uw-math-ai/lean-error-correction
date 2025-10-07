theorem lean_workbook_plus_3572 (X : Finset ℕ) (hX : X = ∅) : (∑ x in X, x) = 0 ∧ (∏ x in X, x) = 1   := by
  simp [hX, Finset.sum_empty, Finset.prod_empty]