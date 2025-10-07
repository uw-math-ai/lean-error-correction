theorem lean_workbook_plus_5972 (f g : ℝ → ℝ) (I : Set ℝ) (hI : I ≠ ∅) (h : f^2 = g^2) : ∀ x ∈ I, f x = g x ∨ f x = -g x   := by
  intro x hx
  simpa [sq_eq_sq_iff_eq_or_eq_neg] using congr_fun h x