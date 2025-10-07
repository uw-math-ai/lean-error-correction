theorem lean_workbook_plus_9007 (x : ℂ) : x^4 - 12*x^3 + 49*x^2 - 78*x + 40 = 0 ↔ x = 1 ∨ x = 2 ∨ x = 4 ∨ x = 5   := by
  refine' ⟨fun h => _, fun h => _⟩
  have h1 : (x - 1) * (x - 2) * (x - 4) * (x - 5) = 0 := by linear_combination h
  simp [sub_eq_zero] at h1
  aesop
  rcases h with (rfl | rfl | rfl | rfl) <;> norm_num