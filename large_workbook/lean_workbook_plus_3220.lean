theorem lean_workbook_plus_3220 (a : ℝ) (h : 0 < a ∧ a < 2) : a < Real.sqrt (2 * a) ∧ Real.sqrt (2 * a) < 2   := by
  refine' ⟨_, _⟩
  exact Real.lt_sqrt_of_sq_lt (by nlinarith)
  rw [Real.sqrt_lt (by nlinarith)]
  all_goals nlinarith [h.1, h.2]