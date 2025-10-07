theorem lean_workbook_plus_8333 (p a b : ℕ) (h1 : (p, a) = 1 ∧ (p, b) = 1) (h2 : p ∣ a^2 + a*b + b^2) : p ∣ 3   := by
  aesop