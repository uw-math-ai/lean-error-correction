theorem lean_workbook_plus_5630 (A B C : Set α) : (A ∪ C) \ B ⊆ (A \ B) ∪ C   := by
  rintro x ⟨h₁ | h₁, h₂⟩ <;> simp_all