theorem lean_workbook_plus_4574 (x : ℤ) (h : x % 2 = 1) : (x ^ 2 + 1) % 2 = 0 ∧ (x ^ 2 + 1) % 4 ≠ 0   := by
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd x
  all_goals (ring_nf; omega)