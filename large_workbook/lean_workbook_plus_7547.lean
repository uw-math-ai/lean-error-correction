theorem lean_workbook_plus_7547 (n : ℕ) (a : Fin n → ℝ) (h : ∀ k : ℕ, ∏ i, (1 + (a i)^k) = 1) : ∀ i, a i = 0   := by
  specialize h 0
  simp [Fin.prod_univ_eq_prod_range] at h
  contrapose! h
  cases' h with i hi
  simp [Fin.sum_univ_eq_sum_range]
  norm_num
  rw [← Nat.cast_two]
  contrapose! hi
  have h₁ : 2^n = 1 := by exact_mod_cast hi
  contrapose! h₁
  apply Nat.ne_of_gt
  simp [pow_pos, zero_lt_two]
  contrapose! h₁
  cases h₁
  rcases i with ⟨⟨⟩, ⟨⟩⟩