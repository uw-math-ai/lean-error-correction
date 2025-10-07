theorem lean_workbook_plus_9027  (p q r a b c α : ℝ)
  (f : ℝ → ℝ)
  (h₀ : ∀ x, f x ∈ Set.Icc (-1) 1)
  (h₁ : f (-1) = p)
  (h₂ : f 0 = q)
  (h₃ : f 1 = r)
  (h₄ : a = (p + r - 2 * q) / 2)
  (h₅ : b = (r - p) / 2)
  (h₆ : c = q)
  (h₇ : 6 * abs a + abs b + 9 * abs c = α) :
  3 * abs (p + r - 2 * q) + 1 / 2 * abs (r - p) + 9 * abs q = α   := by
  rw [h₄, h₅, h₆] at h₇
  rw [abs_div, abs_div, abs_of_pos (show (0 : ℝ) < 2 by norm_num)] at h₇
  linarith [h₀, h₁, h₂, h₃, h₄, h₅, h₆, h₇]