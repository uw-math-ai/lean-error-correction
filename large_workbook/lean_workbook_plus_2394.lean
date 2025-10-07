theorem lean_workbook_plus_2394 (b : ℕ) (h₁ : b > 3) : 2^b + 1 > 3 * b   := by
  induction' h₁ with b h₁ IH <;> simp [*, pow_succ]
  nlinarith [Nat.succ_le_succ h₁]