theorem lean_workbook_plus_559 (a b c : ℝ) (h : |a| ≥ |b + c| ∧ |b| ≥ |c + a| ∧ |c| ≥ |a + b|) :
  a + b + c = 0   := by
  simp [abs_eq_max_neg] at h
  rcases h.1 with (h1 | h1) <;> rcases h.2.1 with (h2 | h2) <;> rcases h.2.2 with (h3 | h3) <;> linarith