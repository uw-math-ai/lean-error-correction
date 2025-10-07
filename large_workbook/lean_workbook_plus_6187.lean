theorem lean_workbook_plus_6187 (x y : ℤ) (h : ∃ k : ℤ, (x^2 - 1) / (y + 1) + (y^2 - 1) / (x + 1) = k) :
    ∃ k₁ k₂ : ℤ, (x^2 - 1) / (y + 1) = k₁ ∧ (y^2 - 1) / (x + 1) = k₂   := by
  refine' ⟨(x ^ 2 - 1) / (y + 1), (y ^ 2 - 1) / (x + 1), rfl, rfl⟩