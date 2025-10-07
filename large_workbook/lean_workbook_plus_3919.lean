theorem lean_workbook_plus_3919 (x y z : ℝ) (h : x ≤ 0 ∧ y ≤ 0 ∧ z ≤ 0 ∧ x * y * z = 1) :
  x + y + z ≤ x ^ 2 + y ^ 2 + z ^ 2   := by
  nlinarith [h.1, h.2.1, h.2.2.1, h.2.2.2]