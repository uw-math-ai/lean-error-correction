theorem lean_workbook_plus_5232 (x y : ℝ) : |x - y| ≤ |2 * x + y| + |x + 2 * y|   := by
  refine' abs_sub_le_iff.2 ⟨_, _⟩
  all_goals cases abs_cases (2 * x + y) <;> cases abs_cases (x + 2 * y) <;> linarith