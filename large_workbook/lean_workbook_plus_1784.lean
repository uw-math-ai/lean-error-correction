theorem lean_workbook_plus_1784  (x : ℝ)
  (h₀ : ∑' k : ℕ, (7 / (2^k)) = x) :
  x = 14   := by
  ring_nf at h₀ ⊢
  rw [tsum_mul_right] at h₀
  nlinarith [tsum_geometric_two]