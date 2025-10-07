theorem lean_workbook_plus_5399 (n : ℤ) : 8 ∣ n ∧ 5 ∣ n ↔ 40 ∣ n   := by
  exact ⟨fun h ↦ by norm_num at h; omega, fun h ↦ by norm_num at h; omega⟩