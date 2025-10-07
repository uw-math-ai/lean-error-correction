theorem lean_workbook_plus_2160  (y : ℕ → ℝ)
  (n : ℕ)
  (h₀ : y 0 = y_0)
  (h₁ : ∀ n, y (n + 1) - 2 * y n = n) :
  y n = (1 + y 0) * 2^n - n - 1   := by
  induction' n with n ih <;> simp_all [pow_succ]
  linarith [h₀, h₁ n, ih]