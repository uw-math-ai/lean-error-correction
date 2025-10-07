theorem lean_workbook_plus_5364 (s : Set ℕ) (h : s.Infinite) :
    ∃ f : ℕ → ℕ, Function.Bijective f   := by
  refine ⟨fun n ↦ n, ⟨fun x y hxy ↦ by simp at hxy; exact hxy, fun y ↦ ⟨y, by simp⟩⟩⟩