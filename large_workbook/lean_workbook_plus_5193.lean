theorem lean_workbook_plus_5193 (f : ℝ → ℝ): (∀ x y, f (x + y) + f (x*y) = f (x^2) + f (y^2)) ↔ ∃ l:ℝ, ∀ x, f x = l   := by
  refine ⟨fun h ↦ ⟨f 1, fun x ↦?_⟩, fun h ↦?_⟩
  have h₁ := h x 1
  norm_num at h₁
  have h₂ := h (x - 1) 1
  have h₃ := h (x - 1) 0
  norm_num at h₁ h₂ h₃
  nlinarith [h₁, h₂, h₃]
  exact fun x y ↦ by rcases h with ⟨l, hl⟩; simp [hl, add_comm, add_left_comm, add_assoc]