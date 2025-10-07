theorem lean_workbook_plus_8876  (a : ℝ)
  (f : ℝ → ℝ)
  (h₀ : f 1 = a)
  (h₁ : f a = -1)
  (h₂ : f (-1) = -a)
  (h₃ : f (-a) = 1) :
  a ≠ 0 ∧ a ≠ 1 ∧ a ≠ -1   := by
  refine' ⟨fun h => _, fun h => _, fun h => _⟩ <;> simp_all