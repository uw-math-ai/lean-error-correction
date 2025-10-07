theorem lean_workbook_plus_3950  (n k : ℤ)
  (h₀ : 0 ≤ k ∧ k ≤ 2) :
  (3 * n + k)^3 % 9 = k^3 % 9   := by
  (ring_nf; simp [Int.add_emod, Int.mul_emod, h₀.1, h₀.2])