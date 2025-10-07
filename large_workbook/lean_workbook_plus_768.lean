theorem lean_workbook_plus_768 (f : ℝ → ℝ):(∀ x y, f (x * y) = x * f y) ↔ ∃ l:ℝ, ∀ x, f x = x * l   := by
  refine' ⟨fun h ↦ ⟨f 1, fun x ↦ by rw [← mul_one x, h, mul_one]⟩, fun h ↦ _⟩
  exact fun x y ↦ by rcases h with ⟨l, hl⟩; rw [hl, hl, mul_assoc]