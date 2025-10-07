theorem lean_workbook_plus_9034 : ∀ x : ℂ, x^4 + x^3 + (9 / 4) * x^2 + x + 1 - (5 / 4) * x^2 = (x^2 + (1 / 2) * x + 1)^2 - ((Real.sqrt 5 / 2) * x)^2   := by
  intro x
  ring_nf
  simp [sq, mul_add, add_mul, mul_comm, mul_assoc, mul_left_comm]
  field_simp [Complex.ext_iff]
  exact ⟨by ring, by ring⟩