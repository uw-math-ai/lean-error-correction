theorem lean_workbook_plus_8987 (x y z : ℝ) (hx : 0 < x ∧ x < 1) (hy : 0 < y ∧ y < 1) (hz : 0 < z ∧ z < 1) : x * (1 - y) + y * (1 - z) + z * (1 - x) < 1   := by
  obtain ⟨hx₁, hx₂⟩ := hx
  obtain ⟨hy₁, hy₂⟩ := hy
  have : 0 < 1 - x := by linarith
  have := mul_lt_mul_of_pos_left hy₂ this
  have : (1 - x) * y < 1 - x := by linarith
  have := mul_lt_mul_of_pos_left hz.2 hy₁
  have := mul_lt_mul_of_pos_left hz.2 hy₁
  have := mul_lt_mul_of_pos_right this hy₁
  have : y * z * y < y * 1 * y := by linarith
  have : x * (1 - y) < x * 1 := by nlinarith
  nlinarith [hx₁, hx₂, hy₁, hy₂, hz.1, hz.2]