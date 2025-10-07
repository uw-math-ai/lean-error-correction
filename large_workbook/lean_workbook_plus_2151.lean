theorem lean_workbook_plus_2151 (c : ℝ) (hc : 0 ≤ c) (f : ℝ → ℝ) (hf: ∀ x, f x = 1 / (c * x + 1)) : ∀ x y, (x > 0 ∧ y > 0) → f x * f (y * f x) = f (x + y)   := by
  simp [hf, mul_add, add_mul, mul_comm, mul_assoc, mul_left_comm]
  refine' fun x y hx hy => by field_simp <;> ring