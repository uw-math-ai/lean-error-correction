theorem lean_workbook_plus_2638 (a b c : ℚ) (h₁ : a = 19/9) (h₂ : b = 13/9) (h₃ : c = 4/3) : a + b + c = 19/9 + 13/9 + 4/3   := by
  norm_num [h₁, h₂, h₃]