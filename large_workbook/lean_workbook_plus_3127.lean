theorem lean_workbook_plus_3127  (x y : ℝ)
  (h₀ : 0 ≤ 1 + x^2 + y^2 + x^2 * y^2)
  (h₁ : 0 ≤ 2 + x^2 + y^2)
  (h₂ : 1 + x^2 + y^2 + x^2 * y^2 ≠ 0)
  (h₃ : 2 + x^2 + y^2 ≠ 0)
  (h₄ : 0 ≤ x * y) :
  (2 * x * y - 1) * (x * y - 1) ≤ 0 ↔ x * y ∈ Set.Icc (1 / 2) 1   := by
  refine' ⟨fun h ↦ ⟨by nlinarith [h₀, h₁, h₂, h₃, h₄, h], by nlinarith [h₀, h₁, h₂, h₃, h₄, h]⟩, fun h ↦ by nlinarith [h₀, h₁, h₂, h₃, h₄, h.1, h.2]⟩