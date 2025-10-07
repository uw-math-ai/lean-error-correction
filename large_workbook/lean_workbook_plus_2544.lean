theorem lean_workbook_plus_2544 (s : ℝ) (h : s ≠ 0) : 6 * s ^ 2 / (2 * s ^ 2 * Real.sqrt 3) = 3 / Real.sqrt 3   := by
  ring_nf at h ⊢
  field_simp [h]