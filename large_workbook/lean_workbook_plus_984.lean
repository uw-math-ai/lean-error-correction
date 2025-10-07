theorem lean_workbook_plus_984 : ∀ a : ℝ, a ≠ 0 ∧ a ≠ -1 → 1/a = 1/(a + 1) + 1/(a*(a + 1))   := by
  intro a ha
  have h1 : a + 1 ≠ 0 := by simpa only [ne_eq, add_eq_zero_iff_eq_neg] using ha.2
  field_simp [ha.1, h1, mul_comm, mul_assoc, mul_left_comm]