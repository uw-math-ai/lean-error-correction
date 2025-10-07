theorem lean_workbook_plus_3188    (x y z w : ℝ)
    (h : x^3 + y^3 + z^3 + w^3 = 4) :
    ∃ μ : ℝ, μ^3 = 4 / (x^3 + y^3 + z^3 + w^3)   := by
  exact ⟨4 / (x^3 + y^3 + z^3 + w^3), by field_simp [h]⟩