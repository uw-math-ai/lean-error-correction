theorem lean_workbook_plus_7004 : ∀ x y z : ℝ, x ≥ 1 ∧ y ≥ 1 ∧ z ≥ 1 → Real.sqrt (3 - 2 * x) ≤ 1 ∧ Real.sqrt (3 - 2 * y) ≤ 1 ∧ Real.sqrt (3 - 2 * z) ≤ 1 → x * y + y * z + z * x ≤ x ^ 2 + y ^ 2 + z ^ 2 ∧ x ^ 2 + y ^ 2 + z ^ 2 ≤ x ^ 3 + y ^ 3 + z ^ 3   := by
  rintro x y z ⟨hx, hy, hz⟩ ⟨h1, h2, h3⟩
  constructor <;> nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]