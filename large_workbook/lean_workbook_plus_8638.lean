theorem lean_workbook_plus_8638 (p : ℕ) (h : p.Prime) (h5 : p ≥ 5) : 4 ∣ p + 1 ∨ 4 ∣ p - 1   := by
  have h1 := Nat.Prime.eq_two_or_odd h
  cases' h1 with h1 h1 <;> simp [h1] at h5 <;> omega