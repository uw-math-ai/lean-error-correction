theorem lean_workbook_plus_963 : ∀ A B C : Set α, ((A ∪ B) ∩ (A ∩ C)) ∩ Bᶜ = (A \ B) \ Cᶜ   := by
  exact fun A B C ↦ by aesop