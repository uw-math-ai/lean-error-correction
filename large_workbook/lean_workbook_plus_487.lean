theorem lean_workbook_plus_487 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b = 1) (h : a^9 + b^9 = 2) : a^2 / b + b^2 / a ≥ 2   := by
  field_simp [ha, hb, hab]
  ring_nf at h ⊢
  field_simp [ha, hb, hab]
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]