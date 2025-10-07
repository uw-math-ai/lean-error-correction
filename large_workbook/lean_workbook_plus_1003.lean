theorem lean_workbook_plus_1003  (a b c d e f : ℕ)
  (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧ 0 < e ∧ 0 < f)
  (h₁ : a * b * c - d * e * f = 1) :
  (a * b * c - d * e * f : ℚ) ≥ 1 / 288   := by
  norm_num [h₀.1, h₀.2.1, h₀.2.2.1, h₀.2.2.2.1, h₀.2.2.2.2.1, h₀.2.2.2.2.2, h₁]
  norm_cast at h₀ h₁ ⊢
  rw [Int.subNatNat_of_le]
  norm_num [h₀.1, h₀.2.1, h₀.2.2.1, h₀.2.2.2.1, h₀.2.2.2.2.1, h₀.2.2.2.2.2, h₁]
  omega