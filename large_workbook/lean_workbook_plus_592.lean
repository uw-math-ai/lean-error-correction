theorem lean_workbook_plus_592 (x y z : ℝ) (h₁ : x + y + z = 5) (h₂ : x*y + y*z + z*x = 3): x + y + z ≤ 5 ∧ x*y + y*z + z*x = 3   := by
  exact ⟨by linarith [h₁, h₂], by linarith [h₁, h₂]⟩