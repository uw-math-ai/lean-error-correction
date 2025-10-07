theorem lean_workbook_plus_544 (f : ℝ → ℝ) (h : ∀ x, f x ^ 2 = 1) : Set.range f ⊆ {1, -1}   := by
  simp only [Set.subset_def, Set.mem_range, Set.mem_insert_iff, Set.mem_singleton_iff]
  aesop