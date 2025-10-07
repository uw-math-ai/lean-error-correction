theorem lean_workbook_plus_6012 (h₁ : 5! = 120) (h₂ : 2! = 2) (h₃ : 3! = 6) (h₄ : 2^2 = 4) (h₅ : 64 = 2^6) : (5! / (2! * 3!)) * 2^2 * (1 / 64) = 5 / 8   := by
  norm_num [h₁, h₂, h₃, h₄, h₅]