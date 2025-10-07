theorem lean_workbook_plus_4977 (a : ℕ → ℕ) (h : a 1 + a 2 + a 3 ≡ 0 [ZMOD 3]) (h' : a 2 + a 3 + a 4 ≡ 0 [ZMOD 3]) : a 1 ≡ a 4 [ZMOD 3]   := by
  simp only [Int.ModEq, Int.ofNat_add, Int.ofNat_mod] at h h' ⊢
  omega