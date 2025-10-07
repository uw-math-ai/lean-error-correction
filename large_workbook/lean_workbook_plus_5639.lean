theorem lean_workbook_plus_5639 (n : ℤ) (h : n ≡ 0 [ZMOD 3]) : n ^ 7 - n ≡ 0 [ZMOD 3]   := by
  simpa only [one_pow, sub_zero] using h.pow 7 |>.sub h