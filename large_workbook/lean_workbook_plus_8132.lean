theorem lean_workbook_plus_8132 (x y z : ℝ) (hx : x > 0) (hy : y > 0) (hz : z > 0) : x + y + z >= x*y*z → 1/(x*y) + 1/(y*z) + 1/(x*z) >= 1   := by
  field_simp [mul_comm]
  intro h₁
  rw [le_div_iff (by positivity)]
  nlinarith [mul_nonneg (mul_nonneg hx.le hy.le) hz.le, h₁]