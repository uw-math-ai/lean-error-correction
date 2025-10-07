theorem lean_workbook_plus_147 (f : ℝ → ℝ) (hf: ∀ x y : ℝ, f (x + y) = f (x - y)) : ∃ a :ℝ, ∀ x : ℝ, f x = a   := by
  refine ⟨f 0, fun x ↦?_⟩
  simpa using hf (x / 2) (x / 2)