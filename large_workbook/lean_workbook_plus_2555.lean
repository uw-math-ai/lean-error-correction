theorem lean_workbook_plus_2555 (α β γ : ℝ) :
  sin α * sin β * sin γ * sin (α + β + γ) =
  sin α * sin γ * sin (α + β) * sin (β + γ) -
  sin α ^ 2 * sin γ ^ 2   := by
  simp [sin_add, cos_add, sin_sub, cos_sub]
  ring
  simp [sin_sq, cos_sq]
  ring