theorem lean_workbook_plus_9323 (f : A → B) : Equivalence (fun a b : A => f a = f b)   := by
  refine ⟨fun _ => rfl, fun h => h.symm, fun h₁ h₂ => h₁.trans h₂⟩