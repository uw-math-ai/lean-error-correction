theorem lean_workbook_plus_5912 (x1 : ZMod 2) (x2 : ZMod 3) (x3 : ZMod 5) (hx1 : x1 ^ 2 = x1) (hx2 : x2 ^ 2 = x2) (hx3 : x3 ^ 2 = x3) : (x1 = 0 ∨ x1 = 1) ∧ (x2 = 0 ∨ x2 = 1) ∧ (x3 = 0 ∨ x3 = 1)   := by
  refine' ⟨_, _, _⟩
  all_goals fin_cases x1 <;> fin_cases x2 <;> fin_cases x3 <;> simp_all
  all_goals norm_cast