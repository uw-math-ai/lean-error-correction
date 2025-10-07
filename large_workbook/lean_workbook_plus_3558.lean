theorem lean_workbook_plus_3558 (f : ℤ → ℤ) (hf : f (-2008) = -1 / (f 0 + 1)) : f (-2008) = -1 / (f 0 + 1)   := by
  simp only [hf, Int.cast_neg, Int.cast_one, Int.cast_add, Int.cast_zero]