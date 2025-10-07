theorem lean_workbook_plus_8064 (x y z s q : ℝ) (hx : x + y + z = s) (hy : x*y + y*z + z*x = q) : s^2 ≥ 3*q   := by
  ring_nf at hx hy ⊢
  rw [← hx, ← hy]
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - z), sq_nonneg (y - z)]