theorem lean_workbook_plus_1479 (a b c : ℤ) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) (hab : a * b * c ≠ 0) : (a / b : ℚ) ^ 3 - (a / b + b / c + c / a) * (a / b) ^ 2 + (a / c + c / b + b / a) * (a / b) - 1 = 0   := by
  field_simp [ha, hb, hc, hab]
  ring