theorem lean_workbook_plus_4250 (f : ℤ → ℤ) (h : f (-1) = -1) : f (-1) = -1   := by
  simp only [h, Int.negSucc_coe, Int.ofNat_eq_coe, Int.cast_negSucc, Int.cast_ofNat]