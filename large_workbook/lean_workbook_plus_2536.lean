theorem lean_workbook_plus_2536 (x : ℝ) (hx : 1 ≤ x ∧ x ≤ 11) : 1 ≤ ⌊x⌋ ∧ ⌊x⌋ ≤ 11   := by
  have h1 := Int.floor_mono hx.1
  have h2 : ⌊x⌋ ≤ ⌊11⌋ := Int.floor_mono hx.2
  aesop