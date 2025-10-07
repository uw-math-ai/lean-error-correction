theorem lean_workbook_plus_4286 (k : ℕ) (h : 1 ≤ k) :
  (1:ℝ) / Real.sqrt (k ^ 2 + k) > (1:ℝ) / (2 * k)   := by
  refine' one_div_lt_one_div_of_lt (by positivity) _
  have : k^2 + k < (2 * k)^2 := by
  simp [sq, mul_add, add_mul, mul_comm, mul_left_comm]
  nlinarith
  rw [Real.sqrt_lt (by positivity)] <;> norm_cast <;> nlinarith