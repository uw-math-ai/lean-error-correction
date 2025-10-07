theorem lean_workbook_plus_3340 (p : ℕ) (hp : p.Prime) (a b : ℕ) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b   := by
  exact hp.dvd_mul.mp h