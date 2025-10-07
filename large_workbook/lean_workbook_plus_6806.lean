theorem lean_workbook_plus_6806 (x : ℝ) (n : ℤ) (a : ℝ) (h₁ : n = Int.floor x) (h₂ : a = x - n) : 0 ≤ a ∧ a < 1   := by
  rw [h₂, h₁]
  exact ⟨by linarith [Int.floor_le x], by linarith [Int.lt_floor_add_one x]⟩