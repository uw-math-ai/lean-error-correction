theorem lean_workbook_plus_848 (n : ℕ) (x : Fin n → ℝ) : 
  |∑ i, x i| ≤ ∑ i, |x i|   := by
  exact (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq (by simp [Finset.sum_const, Finset.card_univ]))