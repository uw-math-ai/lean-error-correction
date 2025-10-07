theorem lean_workbook_plus_7680 :
  ∀ a b c r s A : ℝ, a > 0 ∧ b > 0 ∧ c > 0 ∧ A > 0 ∧ A ≤ π ∧ cos A = (b^2 + c^2 - a^2) / (2 * b * c) ∧ sin A = r / s ∧ tan (A / 2) = r / (s - a) ∧ tan (B / 2) = r / (s - b) ∧ tan (C / 2) = r / (s - c) → tan (A / 2) * tan (B / 2) * tan (C / 2) = r^3 / ((s - a) * (s - b) * (s - c))   := by
  intro a b c r s A h
  field_simp [h.1, h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2.1, h.2.2.2.2.2.1, h.2.2.2.2.2.2.1, h.2.2.2.2.2.2.2]
  ring