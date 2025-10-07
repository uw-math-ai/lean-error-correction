theorem lean_workbook_plus_9533 (a b c : ℝ) (h : a * (a - b) + b * (b - c) + c * (c - a) = 0) : a = b ∧ b = c ∧ c = a   := by
  have h1 : (a - b) * (a - b) + (b - c) * (b - c) + (c - a) * (c - a) = 0 := by linarith
  exact ⟨by nlinarith [h1], by nlinarith [h1], by nlinarith [h1]⟩