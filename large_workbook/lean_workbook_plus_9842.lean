theorem lean_workbook_plus_9842 (a b c : ℝ) (ha : a ∈ Set.Icc 0 1) (hb : b ∈ Set.Icc 0 1) (hc : c ∈ Set.Icc 0 1) : a + b + c - a * b - b * c - c * a ≤ 1   := by
  have h1 : 0 ≤ a * b * c := mul_nonneg (mul_nonneg ha.1 hb.1) hc.1
  nlinarith [mul_nonneg (sub_nonneg.2 ha.2) (sub_nonneg.2 hb.2), mul_nonneg (sub_nonneg.2 hb.2) (sub_nonneg.2 hc.2), mul_nonneg (sub_nonneg.2 hc.2) (sub_nonneg.2 ha.2)]