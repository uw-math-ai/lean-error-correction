theorem lean_workbook_plus_2076 (a b : ℝ) (hab: a ∈ Set.Icc 1 2 ∧ b ∈ Set.Icc 1 2): 4/3 ≤ (a+1)/(b+2) + (b+1)/(a+2) ∧ (a+1)/(b+2) + (b+1)/(a+2) ≤ 3/2   := by
  rcases hab with ⟨h₁, h₂⟩
  rcases h₁ with ⟨h₁_left, h₁_right⟩
  rcases h₂ with ⟨h₂_left, h₂_right⟩
  constructor <;> field_simp <;> rw [div_le_div_iff] <;> nlinarith