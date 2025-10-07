theorem lean_workbook_plus_812  (i j k : ℤ)
  (h₀ : 0 < i ∧ 0 < j ∧ 0 < k)
  (h₁ : i^2 + j^2 + k^2 = 2011)
  (h₂ : i + j + k = 0) :
  - Real.sqrt (3 * 2011) ≤ i + j + k ∧ i + j + k ≤ Real.sqrt (3 * 2011)   := by
  constructor <;> linarith [sq_nonneg (i - 1), sq_nonneg (j - 1), sq_nonneg (k - 1)]