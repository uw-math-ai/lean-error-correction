theorem lean_workbook_plus_4147 (a b : ℕ) : (5*a+7=22 ∧ 6*b+10*a=42) ↔ a = 3 ∧ b = 2   := by
  refine ⟨fun h ↦ ⟨?_,?_⟩, fun h ↦ ⟨?_,?_⟩⟩ <;> linarith