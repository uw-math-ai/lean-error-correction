theorem lean_workbook_plus_795 (n : ℕ) (h : n ≠ 0) : Odd (choose n 1) → Odd n   := by
  simp [choose_one_right, Nat.odd_iff_not_even, Nat.even_iff]