theorem lean_workbook_plus_9621 (a b c : ℝ) (ha : a ∈ Set.Icc 0 1) (hb : b ∈ Set.Icc 0 1) (hc : c ∈ Set.Icc 0 1) : a + b + c ≤ 2 + a * b * c   := by
  have h1 := mul_nonneg (sub_nonneg.2 ha.2) (sub_nonneg.2 hb.2)
  nlinarith [ha.1, ha.2, hb.1, hb.2, hc.1, hc.2, h1]