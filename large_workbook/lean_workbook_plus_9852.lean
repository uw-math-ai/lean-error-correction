theorem lean_workbook_plus_9852 (a b c : ℝ) (hx : x = 3/2) (hab : a + b + c = 3) : a * b ^ x + b * c ^ x + c * a ^ x ≤ 3   := by
  simp [hx, hab]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]