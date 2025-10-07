theorem lean_workbook_plus_5484 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a / (b + c) + b / (c + a) ≤ 1 → c / (a + b) ≥ 1 / 2)   := by
  intro h
  field_simp [ha, hb, hc] at h ⊢
  rw [div_le_div_iff (by positivity) (by positivity)]
  have h1 : 0 < (b + c) * (c + a) := mul_pos (add_pos hb hc) (add_pos hc ha)
  have h2 : 0 < (a + b) * (b + c) := mul_pos (add_pos ha hb) (add_pos hb hc)
  have h3 : 0 < c * 2 := mul_pos hc zero_lt_two
  have h4 : 0 < b * 2 := mul_pos hb zero_lt_two
  rw [div_le_one h1] at h
  nlinarith [sq_nonneg (b - c), sq_nonneg (c - a), sq_nonneg (a - b)]