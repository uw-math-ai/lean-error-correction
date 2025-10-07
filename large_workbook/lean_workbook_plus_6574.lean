theorem lean_workbook_plus_6574 (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p < q) :
    ∃ a b, a ≤ (p-1)/2 ∧ b ≤ (p-1)/2 ∧ 1 + a * (p-1) ≡ 1 + b * (p-1) [ZMOD q]   := by
  refine' ⟨0, 0, by simp [hp, hq, hpq], by simp [hp, hq, hpq], by simp [hp, hq, hpq]⟩