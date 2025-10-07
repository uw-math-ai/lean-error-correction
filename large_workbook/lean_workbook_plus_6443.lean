theorem lean_workbook_plus_6443 (a b c : ℝ) (ha : a > 0) (hb : b > 0) (hc : c > 0) : (1 / (a * (b + 1)) + 1 / (b * (c + 1)) + 1 / (c * (a + 1))) ≥ 1 / (1 + a * b * c)   := by
  field_simp [ha, hb, hc]
  ring_nf
  refine' le_of_sub_nonneg _
  field_simp
  field_simp [add_comm]
  ring_nf
  positivity