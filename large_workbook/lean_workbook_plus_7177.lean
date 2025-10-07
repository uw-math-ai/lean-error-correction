theorem lean_workbook_plus_7177 {a b c : ℝ} (h : a^2 + b^2 = c^2) : ∃ k : ℝ, k^2 * a^2 + k^2 * b^2 = k^2 * c^2   := by
  refine' ⟨0, by simp [h]⟩