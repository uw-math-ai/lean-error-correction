theorem lean_workbook_plus_4865  (w : ℝ)
  (h₀ : w ≠ 0) :
  ((5 * w / 8 + 5 * w / 12 + 5 * w / 16) / w) = 65 / 48   := by
  field_simp <;> ring