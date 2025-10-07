theorem lean_workbook_plus_8739 : ∀ x : ℤ, x^81 + x^49 + x^25 + x^9 + x = x * (x^80 - 1) + x * (x^48 - 1) + x * (x^24 - 1) + x * (x^8 - 1) + 5 * x   := by
  exact fun x ↦ by ring