theorem lean_workbook_plus_333 (c : ℂ) (f : ℂ → ℂ) (hf: f c = 0) (h : c * (c + 1) = 0) : c = 0 ∨ c = -1   := by
  simpa [add_eq_zero_iff_eq_neg] using h