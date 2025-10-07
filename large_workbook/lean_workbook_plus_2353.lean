theorem lean_workbook_plus_2353 {s : ℕ} (h : s ≡ 0 [ZMOD 5]) (h' : s ≡ 0 [ZMOD 6]) : s ≡ 0 [ZMOD 30]   := by
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h h' ⊢
  omega