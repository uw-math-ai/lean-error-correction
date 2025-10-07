theorem lean_workbook_plus_6169 (a b c : ℝ) (ha : a = 25^12) (hb : b = 16^14) (hc : c = 11^16) : b > a ∧ a > c   := by
  refine' ⟨by norm_num [ha, hb, hc], by norm_num [ha, hb, hc]⟩