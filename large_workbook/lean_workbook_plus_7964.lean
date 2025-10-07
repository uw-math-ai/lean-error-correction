theorem lean_workbook_plus_7964 (A B C : Set α) : A \ (B ∩ C) = A \ B ∪ A \ C   := by
  rw [Set.diff_inter, Set.union_comm]