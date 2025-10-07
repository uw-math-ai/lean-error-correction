theorem lean_workbook_plus_358 (x : ℤ) : 13 ≤ |2*x - 7| + |2*x - 9| + |2*x - 11| + |2*x - 13| + |2*x - 15|   := by
  rw [abs_eq_max_neg]
  simp [abs_eq_max_neg]
  omega