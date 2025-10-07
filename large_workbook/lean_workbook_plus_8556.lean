theorem lean_workbook_plus_8556 (a b : ℤ) (x0 : ℤ) (hx0 : x0 ≠ 0) (h : x0^2 + a * x0 + b = 0) : x0 ∣ b   := by
  have h1 : x0 * (x0 + a) = -b := by linarith
  exact ⟨-(x0 + a), by linarith⟩