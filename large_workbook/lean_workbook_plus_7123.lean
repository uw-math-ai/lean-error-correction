theorem lean_workbook_plus_7123 (hx: 1 < 10) (h : 11 ≠ 0): ∃ p, p ∣ 10^11 - 1 ∧ ¬ p ∣ 9   := by
  refine ⟨10^11 - 1, by simp [h], by norm_num⟩