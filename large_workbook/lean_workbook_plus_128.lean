theorem lean_workbook_plus_128 : ∀ n:ℕ, 6 * 4 ^ n ≡ 6 [ZMOD 9]   := by
  simp [Int.ModEq]
  refine' Nat.rec (by norm_num) (fun n ih => _)
  omega