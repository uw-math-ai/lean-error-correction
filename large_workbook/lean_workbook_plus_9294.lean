theorem lean_workbook_plus_9294 :
  4 * x^3 - 3 * x - 2 / (5 * Real.sqrt 5) = 0 ↔ (Real.sqrt 5 * x - 2) * (20 * x^2 + 8 * Real.sqrt 5 * x + 1) = 0   := by
  constructor <;> intro h
  all_goals ring_nf at h ⊢; field_simp at h ⊢; nlinarith