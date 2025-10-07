theorem lean_workbook_plus_1623 (x : ℝ) : x^2 - 9*x + 20 = 0 ↔ x = 4 ∨ x = 5   := by
  constructor <;> intro h
  have h1 : (x - 4) * (x - 5) = 0 := by linarith
  simp [sub_eq_zero] at h1
  exacts [h1, by cases' h with h h <;> rw [h] <;> norm_num]