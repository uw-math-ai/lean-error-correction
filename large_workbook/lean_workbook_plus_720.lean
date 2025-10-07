theorem lean_workbook_plus_720 (x : ℝ) : x^3 - 9*x^2 + 27*x - 27 = 0 ↔ x = 3   := by
  refine' ⟨fun h => _, fun h => by rw [h]; norm_num⟩
  have h1 : (x - 3) ^ 3 = 0 := by linarith
  simpa [sub_eq_zero] using h1