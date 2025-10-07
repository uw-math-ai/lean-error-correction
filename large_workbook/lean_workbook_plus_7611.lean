theorem lean_workbook_plus_7611 (a b c d : ℚ) (h₁ : a = 17 / 2) (h₂ : b = 11) (h₃ : c = 1 / 4) : a * b * c = 187 / 8   := by
  norm_num [h₁, h₂, h₃]