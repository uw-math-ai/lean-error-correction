theorem lean_workbook_plus_1947 {f : A → B} : (∀ y : B, ∃ x : A, f x = y) ↔ ∀ Z : Set B, ∃ X : Set A, f '' X = Z   := by
  refine' ⟨fun h Z ↦ _, fun h y ↦ _⟩
  refine ⟨f ⁻¹' Z,?_⟩
  ext y
  constructor <;> aesop
  obtain ⟨x, rfl⟩ := h y
  exact ⟨x, a, rfl⟩
  obtain ⟨A, hA⟩ := h {y}
  obtain ⟨x, hx⟩ := h {y}
  rw [Set.eq_singleton_iff_unique_mem] at hA hx
  aesop