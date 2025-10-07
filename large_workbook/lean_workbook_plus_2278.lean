theorem lean_workbook_plus_2278 (p : ℕ) (hp : 5 ≤ p) (hp' : Nat.Prime p) : 
  ∃ q : ℕ, p < q ∧ q < 2 * p - 2   := by
  refine ⟨p + 1,?_,?_⟩ <;> omega