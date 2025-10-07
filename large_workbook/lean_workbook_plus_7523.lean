theorem lean_workbook_plus_7523  (x y : ℤ)
  (h₀ : x * y ≡ 1 [ZMOD 2]) :
  x % 2 = 1 ∧ y % 2 = 1   := by
  rw [Int.ModEq] at h₀
  rw [Int.mul_emod] at h₀
  rcases Int.emod_two_eq_zero_or_one x with (h₁ | h₁) <;> rcases Int.emod_two_eq_zero_or_one y with (h₂ | h₂) <;> simp_all