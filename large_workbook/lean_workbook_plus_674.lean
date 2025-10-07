theorem lean_workbook_plus_674 (u : ℕ → ℝ) (h : ∀ n, if n % 2 = 0 then u n = 1 / n else u n = n) : 0 ∈ closure (Set.range u)   := by
  refine' mem_closure_iff_nhds.2 fun t ht => _
  refine ⟨0,?_,?_⟩
  exacts [mem_of_mem_nhds ht, ⟨0, (h 0).trans (by simp)⟩]