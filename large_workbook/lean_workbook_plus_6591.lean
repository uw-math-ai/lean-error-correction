theorem lean_workbook_plus_6591 (x : ℝ) (hx: x >= 2) : x + 1/(x+2) >= 9/4   := by
  field_simp [hx]
  rw [div_le_div_iff] <;> nlinarith