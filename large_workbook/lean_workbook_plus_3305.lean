theorem lean_workbook_plus_3305 : ∀ k : ℕ, 2 ^ (3 * k) ≡ 1 [ZMOD 7]   := by
  simp [pow_mul, pow_two, Int.ModEq]
  exact fun k ↦ Nat.rec (by simp) (fun k IH ↦ by rw [pow_succ]; omega) k