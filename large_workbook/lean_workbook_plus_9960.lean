theorem lean_workbook_plus_9960 (α β : ℂ) (h₁ : α * β = -2) (h₂ : α^2 + β^2 = 4 * (α + β)) : ∃ a b c : ℂ, a * x^2 + b * x + c = (x - α) * (x - β)   := by
  refine' ⟨1, -α - β, α * β, by ring⟩