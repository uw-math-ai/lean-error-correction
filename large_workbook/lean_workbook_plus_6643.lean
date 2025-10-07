theorem lean_workbook_plus_6643 (a b x : ℕ) (hab : Nat.Coprime a b) (h : x ≡ 0 [ZMOD a * b]) : x ≡ 0 [ZMOD a] ∧ x ≡ 0 [ZMOD b]   := by
  refine' ⟨h.of_mul_right _, h.of_mul_left _⟩