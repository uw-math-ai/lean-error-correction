theorem lean_workbook_plus_7511 {α β : ℝ} (hab : α ≠ β) (hα : α^2 - α - 1 = 0)  (hβ : β^2 - β - 1 = 0) (a : ℕ → ℝ) (h : ∀ n, a n = (α^n - β^n) / (α - β)) : ∀ n, a (n + 2) = a (n + 1) + a n   := by
  intro n
  simp [h, pow_add, mul_add, mul_comm, mul_left_comm]
  field_simp [sub_ne_zero.2 hab]
  linear_combination α ^ n * hα - β ^ n * hβ