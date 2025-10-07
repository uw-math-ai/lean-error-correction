theorem lean_workbook_plus_3213 (n : ℤ) : n ^ 2 ≡ 1 [ZMOD 5] ↔ n ≡ 1 [ZMOD 5] ∨ n ≡ -1 [ZMOD 5]   := by
  simp [sq, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
  rw [← Int.emod_add_ediv n 5]
  have h₁ := Int.emod_nonneg n (by norm_num : (5 : ℤ) ≠ 0)
  have h₂ : n % 5 < 5 := Int.emod_lt_of_pos n (by norm_num)
  interval_cases n % 5 <;> simp [Int.mul_emod, Int.add_emod, h₁, h₂]