theorem lean_workbook_plus_3052  (u v w t : ℕ → ℕ)
  (h₀ : u 1 + u 2 = v 1 + v 2)
  (h₁ : v 1 + v 2 = w 1 + w 2)
  (h₂ : w 1 + w 2 = t 1 + t 2)
  (h₃ : u 1 + u 2 + v 1 + v 2 + w 1 + w 2 + t 1 + t 2 = 36) :
  u 1 + u 2 = 9 ∧ v 1 + v 2 = 9 ∧ w 1 + w 2 = 9 ∧ t 1 + t 2 = 9   := by
  exact ⟨by linarith [h₀, h₁, h₂, h₃], by linarith [h₀, h₁, h₂, h₃], by linarith [h₀, h₁, h₂, h₃], by linarith [h₀, h₁, h₂, h₃]⟩