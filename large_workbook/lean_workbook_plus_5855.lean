theorem lean_workbook_plus_5855 (x y z : ℝ) : (x + y + z > 0 ∧ x > 0 ∧ y > 0 ∧ z > 0) → 2 / (x + y) + 2 / (y + z) + 2 / (x + z) ≥ 9 / (x + y + z)   := by
  rintro ⟨h₁, h₂, h₃, h₄⟩
  field_simp [h₁, h₂, h₃, h₄]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]