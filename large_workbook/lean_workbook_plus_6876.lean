theorem lean_workbook_plus_6876 : ∀ {a b : ℕ}, b ∣ a → (2 ^ b - 1) ∣ (2 ^ a - 1)   := by
  rintro a b ⟨c, rfl⟩
  simpa only [one_pow, pow_mul] using nat_sub_dvd_pow_sub_pow _ 1 c