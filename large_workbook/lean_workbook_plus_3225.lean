theorem lean_workbook_plus_3225 (a : ℝ) (ha : 0 < a) :  (∃! x : ℝ, (a^x = x^a ∧ 0 < x)) ∨ (∃ x1 x2 : ℝ, (a^x1 = x1^a ∧ 0 < x1) ∧  (a^x2 = x2^a ∧ 0 < x2) ∧ x1 ≠ x2)   := by
  refine' or_iff_not_imp_right.2 fun h => _
  simp only [not_exists, not_and, not_lt] at h
  refine' ⟨a, _, fun x hx => _⟩ <;> aesop