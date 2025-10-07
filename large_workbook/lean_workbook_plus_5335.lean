theorem lean_workbook_plus_5335 (x y : ℝ) : (x + 1) * (y + 1) * (x * y + 1) / (x ^ 2 + 1) / (y ^ 2 + 1) ≤ 2   := by
  field_simp [add_comm]
  rw [div_le_iff] <;> nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]