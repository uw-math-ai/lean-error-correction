theorem lean_workbook_plus_5165 : ∀ θ : ℝ, tan (θ / 2) ^ 2 = (1 - cos θ) / (1 + cos θ)   := by
  exact fun θ ↦ by rw [tan_eq_sin_div_cos]; field_simp [cos_sq, sin_sq]; ring