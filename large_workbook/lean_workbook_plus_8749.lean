theorem lean_workbook_plus_8749 : ∀ x : ℝ, 0 < x ∧ x ≤ π / 2 → 0 < sin x ∧ sin x ≤ 1   := by
  exact fun x hx => ⟨sin_pos_of_pos_of_lt_pi hx.1 (by linarith), sin_le_one x⟩