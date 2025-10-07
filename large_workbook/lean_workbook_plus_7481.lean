theorem lean_workbook_plus_7481 (x y z : ℝ) (hx : 0 < x ∧ x < 1) (hy : 0 < y ∧ y < 1) (hz : 0 < z ∧ z < 1) (hab : x*y*z = (1 - x)*(1 - y)*(1 - z)) : (1 - x)*y ≥ 1/4 ∨ (1 - y)*z ≥ 1/4 ∨ (1 - z)*x ≥ 1/4   := by
  contrapose! hab
  nlinarith [hx.1, hx.2, hy.1, hy.2, hz.1, hz.2, hab.1, hab.2.1, hab.2.2]