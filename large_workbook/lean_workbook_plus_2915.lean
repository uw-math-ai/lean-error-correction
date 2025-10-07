theorem lean_workbook_plus_2915 (n : ℕ) : (1 / (3 * n + 1) + 1 / (3 * n + 2) - 1 / (3 * n + 3) : ℚ) = (9 * n ^ 2 + 18 * n + 7) / ((3 * n + 3) * (3 * n + 2) * (3 * n + 1))   := by
  field_simp <;> ring