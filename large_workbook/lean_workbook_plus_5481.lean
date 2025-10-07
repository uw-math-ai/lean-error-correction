theorem lean_workbook_plus_5481  (a b c x y : ℤ) (n m : ℤ) (h₁ : a > 0) (h₂ : n = a^2 + 1) (h₃ : m = a^2) (h₄ : (b, c) = (y, x)) : a^2 + b^2 + (a * b)^2 = c^2 ↔ x^2 - n * y^2 = m   := by
  simp [h₁, h₂, h₃, h₄]
  obtain ⟨rfl, rfl⟩ := h₄
  constructor <;> intro h <;> linarith