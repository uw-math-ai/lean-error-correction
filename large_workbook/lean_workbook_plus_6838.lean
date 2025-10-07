theorem lean_workbook_plus_6838 {p n : ℕ} (hp : p.Prime) (hpo : Odd p) (h : ((n:ℤ)^(p-1) ≡ (-1:ℤ)^((p-1)/2) [ZMOD p])) : n^(p-1) ≡ (-1)^((p-1)/2) [ZMOD p]   := by
  simpa only [Int.ModEq] using h