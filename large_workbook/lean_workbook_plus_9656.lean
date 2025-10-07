theorem lean_workbook_plus_9656 {x y : ℤ} (h : x^2 - 2 ≡ -y [ZMOD 4]) : y ≡ 1 [ZMOD 4] ∨ y ≡ 2 [ZMOD 4]   := by
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd x
  all_goals (ring_nf at h; simp [Int.ModEq] at h ⊢; omega)