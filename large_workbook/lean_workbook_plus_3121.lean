theorem lean_workbook_plus_3121 (n : ℕ) : n * (n - 1) = 2 * choose n 2   := by
  simp [choose_two_right]
  rcases even_or_odd n with ⟨n, rfl⟩ | ⟨n, rfl⟩ <;> ring_nf
  all_goals omega