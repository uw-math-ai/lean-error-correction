theorem lean_workbook_plus_1723 (n : ℕ) (x y z : ℕ → ℕ) (h₁ : ∀ i, 0 < x i ∧ 0 < y i ∧ 0 < z i) (h₂ : ∀ i, z i < y i) : ∑ i in Finset.range n, x i * z i ≤ ∑ i in Finset.range n, x i * y i   := by
  refine' Finset.sum_le_sum fun i _ => _
  exact mul_le_mul_of_nonneg_left (h₂ i).le (h₁ i).1.le