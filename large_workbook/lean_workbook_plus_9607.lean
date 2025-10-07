theorem lean_workbook_plus_9607 (x : ℝ) : sin x = 0 ↔ ∃ n : ℤ, x = n * π   := by
  simp [Real.sin_eq_zero_iff]
  constructor <;> rintro ⟨n, rfl⟩ <;> exact ⟨n, rfl⟩