theorem lean_workbook_plus_6476 (n : ℕ) : (2014^n - n^2014 ≡ 0 [ZMOD 11]) → n >= 1   := by
  intro h
  contrapose! h
  interval_cases n <;> simp [Int.ModEq]