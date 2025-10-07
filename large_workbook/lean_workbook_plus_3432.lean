theorem lean_workbook_plus_3432 (f : ℕ → ℕ) (P : ℕ → ℕ → Prop) (hP : ∀ x y, P (f x) y → f (x * y) = f x * f y) : ∀ x y, P (f x) y → f x * f y = f x * f y   := by
  simp [hP]