theorem lean_workbook_plus_8520 (f : ℝ → ℝ) (hf : ∀ x ≠ 0, 3 * f x - 5 * x * f (1 / x) = x - 7) : f 2010 = 4021   := by
  have h1 := hf 2010 (by norm_num)
  have h2 := hf (1/2010) (by norm_num)
  field_simp at h1 h2 <;> linarith