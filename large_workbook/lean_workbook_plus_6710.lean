theorem lean_workbook_plus_6710 : ∀ u v w x : ℂ, (x - u) * (x - v) * (x - w) = x^3 - (u + v + w) * x^2 + (u * v + v * w + w * u) * x - u * v * w   := by
  exact fun u v w x ↦ by ring