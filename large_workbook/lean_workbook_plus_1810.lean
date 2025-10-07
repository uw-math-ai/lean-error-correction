theorem lean_workbook_plus_1810 (a b c : ℝ) (ha : a > 0 ∧ b > 0 ∧ c > 0 ∧ a * b * c = 1) : 1 / (2 * a ^ 3 + 1) * (a ^ 3 + 2) + 1 / (2 * b ^ 3 + 1) * (b ^ 3 + 2) + 1 / (2 * c ^ 3 + 1) * (c ^ 3 + 2) ≥ 1 / 3   := by
  simp [div_eq_mul_inv, add_comm, add_left_comm, add_assoc]
  have h1 := ha.1
  have h2 := ha.2.1
  have h3 : c > 0 := ha.2.2.1
  have h4 : 0 ≤ a^3 := by positivity
  have h5 : 0 ≤ b ^ 3 := by positivity
  have h6 : 0 ≤ c ^ 3 := by positivity
  have h7 : 0 ≤ a ^ 3 * b ^ 3 * c ^ 3 := by positivity
  have h8 : 0 ≤ 1 + 2 * a ^ 3 := by linarith
  have h9 : 0 ≤ 1 + 2 * b ^ 3 := by linarith
  have h10 : 0 ≤ 1 + 2 * c ^ 3 := by linarith
  have h11 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h12 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h13 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h14 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h15 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h16 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  have h17 : 0 ≤ 1 + 2 * a ^ 3 + 2 * b ^ 3 + 2 * c ^ 3 := by linarith
  field_simp [h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17]
  rw [div_le_div_iff] <;> nlinarith