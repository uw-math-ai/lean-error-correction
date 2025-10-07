theorem lean_workbook_plus_2045 (x y : ℤ) (h : x^3 + x^2 + 2*y - 8 = 0) : y = 4 - (x^2 * (x+1)) / 2   := by
  ring_nf at h ⊢
  omega