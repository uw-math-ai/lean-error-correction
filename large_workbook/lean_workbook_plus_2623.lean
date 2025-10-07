theorem lean_workbook_plus_2623 (x y z : ℤ) (hxy : x ≠ y) (hyz : y ≠ z) (hxz : x ≠ z) : 5 * (x - y) * (y - z) * (z - x) ∣ (x - y) ^ 5 + (y - z) ^ 5 + (z - x) ^ 5   := by
  apply Dvd.intro (x^2 + y^2 + z^2 - x * y - x * z - y * z)
  ring