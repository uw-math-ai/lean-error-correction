theorem lean_workbook_plus_5192 (f : ℤ → ℤ) (hf: f = fun x ↦ x) : ∀ x y, f (x^2 + x*y + y) = f x^2 + f (x + 1) * f y   := by
  simp [hf, sq, mul_add, add_mul, add_assoc, add_comm, add_left_comm]