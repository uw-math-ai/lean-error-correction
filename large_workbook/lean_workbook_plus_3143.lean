theorem lean_workbook_plus_3143 (x y z : ℝ) : |x - 2*y + z| ≤ |x-y| + |z-y|   := by
  have := abs_add (x - y) (z - y)
  simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm] at this ⊢
  simpa [two_mul] using this