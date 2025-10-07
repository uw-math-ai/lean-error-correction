theorem lean_workbook_plus_4358 (a b : ℝ) (ha : 1 ≤ a ∧ a ≤ 2) (hb : 1 ≤ b ∧ b ≤ 2) : (a + 1) / (b + 2) + (b + 1) / (a + 2) ≤ 3 / 2   := by
  rw [div_add_div _ _ (by linarith) (by linarith)]
  rw [div_le_iff]
  all_goals nlinarith [ha.1, ha.2, hb.1, hb.2]