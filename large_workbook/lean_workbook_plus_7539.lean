theorem lean_workbook_plus_7539 (x y z : ℤ) (h : x * y * z ≠ 0) : x^4 + 2*y^4 = z^2 ↔ ∃ x0 y0 z0 : ℤ, x0 * y0 * z0 ≠ 0 ∧ x^4 + 2*y^4 = z^2   := by
  refine' ⟨fun h' => ⟨x, y, z, h, h'⟩, fun h' => _⟩
  exact h'.choose_spec.choose_spec.choose_spec.2