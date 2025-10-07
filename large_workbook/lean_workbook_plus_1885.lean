theorem lean_workbook_plus_1885 (A B C : ℝ) (hA : 0 < A ∧ A <= π ∧ B <= π ∧ C <= π ∧ A + B + C = π) : Real.sin (2 * A) + Real.sin (2 * B) + Real.sin (2 * C) = 4 * Real.sin A * Real.sin B * Real.sin C   := by
  simp [sin_two_mul, cos_two_mul, hA.1, hA.2.1, hA.2.2.1, hA.2.2.2.1, hA.2.2.2.2]
  have h₁ : A + (B + C) = π := by linarith
  have h₂ : C = π - (A + B) := by linarith
  rw [h₂, sin_pi_sub, cos_pi_sub, ← sub_eq_zero]
  ring_nf
  simp [sin_add, cos_add, mul_sub, mul_add, sub_add, sub_sub, sub_mul, mul_comm, mul_left_comm]
  ring_nf
  simp [sin_sq, cos_sq, add_assoc, add_comm, add_left_comm]
  ring_nf