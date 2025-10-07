theorem lean_workbook_plus_6709 (x y a b : ℤ) (n : ℕ) : (4*a - b = x ∧ 4*b - a = y ∧ x*y = 2010^n) → a = (4*x + y)/15 ∧ b = (x + 4*y)/15   := by
  omega