theorem lean_workbook_plus_6203 : ∃ a b : ℤ, a ≠ 0 ∨ b ≠ 0 ∧ abs a ≤ 18 ∧ abs b ≤ 18 ∧ ∀ x y : ℝ, abs (a * sin x + b * cos y) < 1 / 9   := by
  refine' ⟨18, 0, by norm_num⟩