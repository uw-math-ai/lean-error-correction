theorem lean_workbook_plus_3871 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) : (x + y) / (x + y + 1) ≤ x / (x + 1) + y / (y + 1) ∧ x / (x + 1) + y / (y + 1) ≤ (2 * (x + y)) / (x + y + 2)   := by
  refine' ⟨_, _⟩
  all_goals field_simp [add_comm, add_left_comm, add_assoc]
  all_goals
  rw [div_le_div_iff (by positivity) (by positivity)]
  ring_nf
  nlinarith [sq_nonneg (x - y)]