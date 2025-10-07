theorem lean_workbook_plus_9388 (a b : ℝ) : (x^2 - (a^2 - a + 1) * (x - b^2 - 1) - (b^2 + 1)^2 = 0) ↔ (x = a^2 - a - b^2) ∨ (x = b^2 + 1)   := by
  refine' ⟨fun h => _, fun h => _⟩
  have h1 : (x - (a ^ 2 - a - b ^ 2)) * (x - (b ^ 2 + 1)) = 0 := by linarith
  simp [sub_eq_zero] at h1
  exacts [h1, h.elim (fun h2 => h2.symm ▸ by linarith) (fun h2 => h2.symm ▸ by linarith)]