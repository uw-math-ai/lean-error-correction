theorem lean_workbook_plus_1986 (x : ℝ) : (x ≤ -5 ∨ 3 ≤ x) ↔ x ∈ Set.Iic (-5) ∪ Set.Ici 3   := by
  simp [Set.mem_union, Set.mem_Iic, Set.mem_Ici]