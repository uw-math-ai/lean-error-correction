theorem lean_workbook_plus_4094 (x : ℝ) : |x| ≤ 1/2 * x^2 + 1/2 ↔ (|x| - 1)^2 ≥ 0   := by
  field_simp [sub_sq, add_comm]
  constructor <;> intro h <;> linarith [abs_nonneg x]