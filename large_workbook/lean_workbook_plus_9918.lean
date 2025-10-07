theorem lean_workbook_plus_9918 (x y a : ℝ) (ha : 0 < a) (hx : 0 < x) (hy : 0 < y) (hxy : x < y) : x / y < (x + a) / (y + a)   := by
  rw [div_lt_div_iff] <;> nlinarith