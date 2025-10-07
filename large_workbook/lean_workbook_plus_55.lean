theorem lean_workbook_plus_55 (p q r : ℕ) (h1 : p * r > q ^ 2) (h2 : q * r > p ^ 2) : (p * r) * (q * r) > p ^ 2 * q ^ 2   := by
  nlinarith [sq_nonneg (p * r - q ^ 2), sq_nonneg (q * r - p ^ 2)]