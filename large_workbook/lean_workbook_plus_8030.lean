theorem lean_workbook_plus_8030 : ∀ x y z : ℝ, x^2*y + y^2*z + z^2*x = x*y^2 + y*z^2 + z*x^2 ↔ x = y ∨ y = z ∨ z = x   := by
  aesop
  have : (x - y)*(y - z)*(z - x) = 0 := by linarith
  contrapose! this
  exacts [mul_ne_zero (mul_ne_zero (sub_ne_zero.mpr this.1) (sub_ne_zero.mpr this.2.1)) (sub_ne_zero.mpr this.2.2), by ring, by ring, by ring]