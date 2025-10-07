theorem lean_workbook_plus_5613 (x : ℝ) (hx : 0 < x ∧ x < 1) :
  x^8 + x^7 + x^6 - x^5 + x^3 - x^2 + 1 ≥ 0   := by
  nlinarith [pow_pos hx.1 8, pow_pos hx.1 7, pow_pos hx.1 6, pow_pos hx.1 5, pow_pos hx.1 3, pow_pos hx.1 2]