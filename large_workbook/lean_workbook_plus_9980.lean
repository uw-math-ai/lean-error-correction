theorem lean_workbook_plus_9980 (x k : ℂ) : (x^4 - 2 * k * x^2 - x + k^2 - k = 0) ↔ (k = x^2 + x + 1 ∨ k = x^2 - x)   := by
  refine' ⟨fun h ↦ _, fun h ↦ _⟩
  have h1 : k - (x^2 + x + 1) = 0 ∨ k - (x^2 - x) = 0 := by apply eq_zero_or_eq_zero_of_mul_eq_zero; linear_combination h
  exacts [h1.elim (fun h2 ↦ Or.inl (by linear_combination h2)) (fun h2 ↦ Or.inr (by linear_combination h2)), by rcases h with (rfl | rfl) <;> ring]