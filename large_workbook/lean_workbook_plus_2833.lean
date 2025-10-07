theorem lean_workbook_plus_2833 (n : ℕ) (a : Fin n → ℝ) (ha : ∀ i, a i ∈ Set.Icc 0 1) :
  ∑ i, (∏ j, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0) ≤ 1   := by
  have h1 : ∀ i : Fin n, 0 ≤ a i := fun i ↦ (ha i).1
  have h2 : ∀ i : Fin n, a i ≤ 1 := fun i ↦ (ha i).2
  refine' le_of_forall_pos_le_add fun ε hε => _
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  = ∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0 := by rfl
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then √(a j ^ n) * √(1 - a i) else 0)
  calc (∑ i : Fin n, ∏ j : Fin n, if j ≠ i then Real.sqrt (a j ^ n) * Real.sqrt (1 - a i) else 0)
  have h3 : ∀ i, a i ≤ 1 := fun i ↦ (ha i).2
  have h4 : ∀ i : Fin n, 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h5 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  rw [Finset.sum_eq_multiset_sum]
  have h6 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h7 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h8 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h9 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h10 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h11 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h12 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  have h13 : ∀ (i : Fin n), 0 ≤ 1 - a i := by intro i; linarith [h1 i, h2 i]
  simp [h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, hε]
  apply le_of_lt
  calc (∑ x : Fin n, ∏ x_1 : Fin n, if x_1 = x then 0 else √(a x_1 ^ n) * √(1 - a x))
  calc (∑ x : Fin n, ∏ x_1 : Fin n, if x_1 = x then 0 else √(a x_1 ^ n) * √(1 - a x))
  calc (∑ x : Fin n, ∏ x_1 : Fin n, if x_1 = x then 0 else √(a x_1 ^ n) * √(1 - a x))
  refine' lt_of_le_of_lt _ (by linarith)
  apply le_of_lt
  refine' lt_of_le_of_lt _ hε
  refine' Finset.sum_nonpos _
  intro i _
  rw [Finset.prod_eq_mul_prod_diff_singleton]
  rw [if_pos rfl]
  all_goals simp [h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13]