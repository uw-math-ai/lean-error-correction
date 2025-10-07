theorem lean_workbook_plus_125 (a b c d : ℤ) (h : ∀ x, 5 ∣ a * x ^ 3 + b * x ^ 2 + c * x + d) : 5 ∣ a ∧ 5 ∣ b ∧ 5 ∣ c ∧ 5 ∣ d   := by
  have h5 : ∀ x : ℤ, 5 ∣ (a * x ^ 3 + b * x ^ 2 + c * x + d) := h
  obtain ⟨ha, hb, hc, hd⟩ := h 0, h 1, h (-1), h 2
  exact ⟨by norm_num at ha hb hc hd; omega, by norm_num at ha hb hc hd; omega, by norm_num at ha hb hc hd; omega, by norm_num at ha hb hc hd; omega⟩