theorem lean_workbook_plus_5654 (f : ℝ → ℝ) (hf: f = fun x => 1/x + 2005) : f 1 = 2006   := by
  norm_num [hf, show (1 : ℝ) ≠ 0 by norm_num]