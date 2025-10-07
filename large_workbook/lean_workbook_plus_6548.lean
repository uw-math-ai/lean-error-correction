theorem lean_workbook_plus_6548 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (h : x^5 + y^5 = 2) : (x^2 + y^6)*(x^8 + y^4) + 2 ≥ x^10 + y^10   := by
  ring_nf at h ⊢
  norm_num [hx, hy, h]
  nlinarith [sq_nonneg (x^2 * y^2), sq_nonneg (x^4 * y^3)]