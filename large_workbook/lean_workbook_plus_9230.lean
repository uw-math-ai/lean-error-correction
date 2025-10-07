theorem lean_workbook_plus_9230 (a : ℝ) (ha : 0 ≤ a) : ∃ f : ℝ → ℝ, ∀ x, (x < a ∧ f x = a / (a - x)) ∨ (x ≥ a ∧ f x = 0)   := by
  refine' ⟨fun x => if x < a then a / (a - x) else 0, fun x => _⟩
  exact if h : x < a then Or.inl ⟨h, if_pos h⟩ else Or.inr ⟨not_lt.1 h, if_neg h⟩